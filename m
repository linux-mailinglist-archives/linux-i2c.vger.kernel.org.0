Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 524BC23105F
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 19:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731616AbgG1REi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 13:04:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:38740 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731070AbgG1REi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Jul 2020 13:04:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9110BB14B;
        Tue, 28 Jul 2020 17:04:47 +0000 (UTC)
Date:   Tue, 28 Jul 2020 19:04:35 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     daniel.stodden@gmail.com, linux-i2c@vger.kernel.org,
        Daniel Stodden <dns@arista.com>
Subject: Re: [RFC PATCH] i2c: Support Smbus 3.0 block sizes up to 255 bytes.
Message-ID: <20200728190435.3c4f5d5e@endymion>
In-Reply-To: <20200728094037.GA980@ninjato>
References: <20200728004708.4430-1-daniel.stodden@gmail.com>
        <20200728094037.GA980@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram, Daniel,

On Tue, 28 Jul 2020 11:40:37 +0200, Wolfram Sang wrote:
> > -	__u8 block[I2C_SMBUS_BLOCK_MAX + 2]; /* block[0] is used for length */
> > +	__u8 block[I2C_SMBUS3_BLOCK_MAX + 2]; /* block[0] is used for length */
> >  			       /* and one more for user-space compatibility */  
> 
> I thought about this, too, and wondered if this isn't a size regression
> in userspace with every i2c_smbus_data getting 8 times the size? But
> maybe it is worth if backwards compatibility is maintained in an
> otherwise not so intrusive manner? Jean, what do you think?

In i2c-tools these are always allocated on the stack and one at a time.
Size isn't an issue in my opinion.

The only thing I'm truly concerned about here is compatibility. You
need to ensure that:

* User-space binaries that are around today (obviously compiled with
  the old versions of the kernel uapi headers) will work the same with
  kernels including your changes.

* User-space binaries compiled with the new kernel uapi headers will
  work with both old and new kernels.

For all transfer types. You will have to keep in mind that SMBus-style
and I2C-style read block transfers differ in who decides the length.
For I2C, it is the caller (I want to read N bytes from this location),
for SMBus it is the slave (I want to read a block from this location,
tell me how long it is). In both cases you need to ensure you do not
write beyond the buffer, no matter what, and return a proper error code
if it wouldn't fit.

The other compatibility type you need to care about is inside the
kernel itself: SMBus 2 and SMBus 3 controllers and devices may be mixed
up. Some (I expect most) SMBus 3 devices may be able to work with SMBus
2 controllers in "degraded" mode, in which case it will be the driver's
responsibility to check the capabilities of the controller and only use
transfer types that are supported. If such "degraded" mode is not
possible then the driver would simply refuse to bind. For such checks
to be possible, I would expect either one global I2C_FUNC_SMBUS* flag
to be added to denote SMBus 3 compliance, or possibly several flags for
finer grained control (seems overkill to me but you may have a
different opinion - also depends on what else SMBus 3 is introducing,
I admit I did not check). However I did not see that in your prototype.
Do you believe we can do without it? If so, please explain how.

-- 
Jean Delvare
SUSE L3 Support
