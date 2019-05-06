Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 561FE1472E
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 11:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbfEFJGt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 05:06:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:38920 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725890AbfEFJGt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 May 2019 05:06:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 0EEB1AF35;
        Mon,  6 May 2019 09:06:48 +0000 (UTC)
Date:   Mon, 6 May 2019 11:06:46 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Dreamcat4 <dreamcat4@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [decode-dimms] Crucial Ballistix BLS2K16G4D30AESB, cannot
 decode / understand timings
Message-ID: <20190506110646.55cfc6ca@endymion>
In-Reply-To: <bf2a2dce-694c-db9b-e91e-deae4051d44b@linux.intel.com>
References: <CAN39uTqhOxGSFvPsvZawBD-7kPLo9j0ONNYNyADXP9yqqwHEfA@mail.gmail.com>
        <20190411201628.4e7521a3@endymion>
        <CAN39uTqoWxJDFtVH6hzk5uSeqS-szOn8FfPs8L7s6Wray_1BdQ@mail.gmail.com>
        <20190411211239.440d71f1@endymion>
        <CAN39uTrd4zw+mWa=zSjZF+zNH-B1B2+YwO_4913FDP56iQNb9w@mail.gmail.com>
        <20190412164325.0b410662@endymion>
        <CAN39uTpx+daGd1w6k=sKQMQzUSJqvQxYLaD96fszap2=w63qVg@mail.gmail.com>
        <20190412204203.69f4a4be@endymion>
        <f1e9c190-7956-25c3-8e99-3a2ec100fd1a@linux.intel.com>
        <20190415152441.451c0e66@endymion>
        <CAN39uTqWDpRYOyHWfcEMoamPPuFJXFZwgYpMVDM4-aTz5yicOw@mail.gmail.com>
        <20190416165946.48059d1c@endymion>
        <8052f568-32ab-7104-b9bb-7bcb07179a6c@linux.intel.com>
        <20190417174002.651974bd@endymion>
        <06a90410-851f-618c-c203-ed3fc414ea18@linux.intel.com>
        <20190419203909.2b8991a1@endymion>
        <CAN39uTp_NTiUB_ZbhZkYQia3-YC0on_A5g87mt8T4uBYsKkb9Q@mail.gmail.com>
        <20190419223118.28b70421@endymion>
        <bf2a2dce-694c-db9b-e91e-deae4051d44b@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 23 Apr 2019 17:55:54 +0300, Jarkko Nikula wrote:
> On 4/19/19 11:31 PM, Jean Delvare wrote:
> > This was only for testing... I'll post clean patches soon.
> > 
> > Thanks for testing so quickly, appreciated.
>
> Your updated ee1004 driver works here too on 2* and 4* Crucial DIMMs 
> cases. I.e. decode-dimms is detecting them and outputting sensible 
> looking data which was possible before only when both 2* Crucial + 2* 
> Micron DIMMs were plugged in together.

Thank you Jarkko and Dreamcat4 for all the tests so far. As I was about
to send the patches for upstream inclusion, I noticed that the driver
doesn't actually use the SMBus command which is mentioned in the EE1004
specification to select the page. The driver sends one dummy byte after
the I2C device address, while the specification says to send two dummy
bytes.

Well, to be honest I can't see from a technical perspective how 2 dummy
bytes could succeed if 1 dummy byte fails - I assume the NACK is sent
by the EEPROM after the 1st dummy byte before it has any idea if
anything is coming next - but to be on the safe side, I would
appreciate if either of you could try the following command with the
"failing" setup (2* Crucial):

# i2cset <N> 0x36 0x00 0x00

(where <N> is the I2C bus number of the i2c-i801)

If it still fails they I'll submit what I have. It it does work then
I'll write a different patch.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
