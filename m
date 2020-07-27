Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFAC22E7EE
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 10:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgG0IhZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 27 Jul 2020 04:37:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:60644 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbgG0IhZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Jul 2020 04:37:25 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3FC9EAC37;
        Mon, 27 Jul 2020 08:37:34 +0000 (UTC)
Date:   Mon, 27 Jul 2020 10:37:23 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Daniel Stodden <daniel.stodden@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: i2c block reads > 32 bytes
Message-ID: <20200727103723.31f28e07@endymion>
In-Reply-To: <F76BBB88-55D9-466F-8E39-730D18766917@gmail.com>
References: <9329EDA0-18B6-48EB-AD2B-AA27FAC6FF0A@gmail.com>
        <20200726103445.GA1714@kunai>
        <F76BBB88-55D9-466F-8E39-730D18766917@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

On Sun, 26 Jul 2020 16:21:28 -0700, Daniel Stodden wrote:
> I haven’t spent time on strategies upgrading i2c_smbus_data before
> now. Rather I2C_RDWR, but I’m starting to reconsider, based on what
> you write.
> 
> With ’set in stone’ I was just echoing what I found old posts, which
> seemed to acknowledge the difficulties:
> 
> E.g. "this will never change“ in
> https://marc.info/?l=git-commits-head&m=113053689014136&w=2.
> 
> These comments are 15 years old now, but to me it seemed to anticipate that any
> later evolution would naturally pick I2C_RDWR over I2C_SMBUS. That’s about
> where my ’set in stone' came from. Anway, let’s scratch that.

This "it will never change" was written before SMBus 3.0 came to
existence. The point of this commit was to clarify that there was only
one block size limit at the time and it came from the SMBus
specification. There is no limit at the I2C level so
I2C_SMBUS_I2C_BLOCK_MAX was a nonsense in the first place.

This says nothing about the inability to change I2C_SMBUS_BLOCK_MAX if
a future SMBus specification needs that. Keeping compatibility in mind,
of course.

> The level of compatbility offered through
> i2c_smbus_xfer_emulated is probably essential anywhere (kernel + user
> clients). So leaving out I2C_SMBUS and relying only on I2C_RDWR seems
> incomplete.

Correct. Actually I2C_RDWR is for I2C-level transactions, not
SMBus-level, and as such the reason why I2C_SMBUS_BLOCK_MAX appears in
that code path is not obvious and should be investigated. It might be a
shortcut that was considered acceptable due to SMBus being the only
user of I2C_M_RD in practice at that time (this is definitely no longer
true).

> (Similarly, assuming that any adapter capable of transfers > 32 bytes
> will implement master_xfer (mine does that) rather than smbus_xfer was
> probably naive of me.)

Yes it was ;-) master_xfer is for I2C-level transfers, smbus_xfer for
SMBus-level transfers. It's not only a matter of maximum block size,
SMBus is really a subset of what I2C allows in all dimensions, and
SMBus-only controllers can't implement master_xfer (if they did then
the clients would assume they have access to *all* of I2C, and would be
deeply disappointed then they realize it isn't the case).

The rule that transfers > 32 bytes implied I2C held as long as the
32-byte limit was set by SMBus. Now that SMBus raised that limit, this
is no longer the case.

If there currently are code paths that go through master_xfer and DO
enforce the 32-byte limit, I would call that a bug, which should be
investigated and fixed independently of adding support for larger block
sizes to the SMBus code paths. The latter is new from SMBus 3.x, while
the former should have been working from the beginning.

> (...)
>  * Alternatively, I could see room for a union i2c_smbus30_data, to
>    leave the classic i2c_smbus_data alone.

That was my idea as well. i2c_smbus_data is part of the user-space API
and as such I don't think incompatible changes can even be considered.

> 
>    This in turn would render i2c_smbus_ioctl_data.data as a union pointer-type.
> 
>  * Semantics for i2c_smbus_ioctl_data.size have always been strictly
>    defined: valid range is currently 0..8.
> 
>    Would we consider allocating bit positions greater
>    size[0:3] do communicate a user block size of
>    I2C_SMBUS30_BLOCK_MAX, next to the given transaction type?
> 
>    #define I2C_SMBUS_QUICK	    0
>    [..]
>    #define I2C_SMBUS_I2C_BLOCK_DATA    8
>    #define I2C_SMBUS30_BLOCKSIZE    (1<<31)
> 
>    or similar?

"size" in this context has always been a misnomer, what is really
encoded in that field is an SMBus transfer type without its "direction"
(the whole transfer type being expressed by the combination of
"read_write" and "size"). While having a 32-bit field to store that
information was clearly too much, I would refrain from abusing this
field for other purposes unless alternatives are worse.

Instinctively I would rather define new I2C_SMBUS3_BLOCK_DATA and
I2C_SMBUS3_BLOCK_PROC_CALL if that solves the problem.

Note that we have room left to introduce I2C_M_* and/or I2C_FUNC_*
flags to indicate the use of, or compatibility with, the new maximum
block size. Hopefully this should ensure a smooth transition and
cohabitation between current and future hardware and drivers.

> (...)
> Is i2c-tools maintaned by roughly the same folks reading linux-i2c?
> Who else cares most, besides kernel clients?

i2c-tools is maintained by me with the help of Wolfram. Note that I am
not subscribed to linux-i2c at the moment so please make sure you Cc me
in every thread dealing with this issue.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
