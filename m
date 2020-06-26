Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83DF520B2AB
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jun 2020 15:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728277AbgFZNko convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 26 Jun 2020 09:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgFZNko (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Jun 2020 09:40:44 -0400
X-Greylist: delayed 407 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 26 Jun 2020 06:40:44 PDT
Received: from unicorn.mansr.com (unicorn.mansr.com [IPv6:2001:8b0:ca0d:8d8e::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B1BC03E979
        for <linux-i2c@vger.kernel.org>; Fri, 26 Jun 2020 06:40:44 -0700 (PDT)
Received: by unicorn.mansr.com (Postfix, from userid 51770)
        id 6C3D515360; Fri, 26 Jun 2020 14:33:54 +0100 (BST)
From:   =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: core: check returned size of emulated smbus block read
References: <20200613104109.2989-1-mans@mansr.com>
        <20200626082208.GA4559@kunai>
Date:   Fri, 26 Jun 2020 14:33:54 +0100
In-Reply-To: <20200626082208.GA4559@kunai> (Wolfram Sang's message of "Fri, 26
        Jun 2020 10:22:08 +0200")
Message-ID: <yw1x1rm2vtml.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram Sang <wsa@the-dreams.de> writes:

> On Sat, Jun 13, 2020 at 11:41:09AM +0100, Mans Rullgard wrote:
>> If the i2c bus driver ignores the I2C_M_RECV_LEN flag (as some of
>> them do), it is possible for an I2C_SMBUS_BLOCK_DATA read issued
>
> Out of interest, which driver did you use?

I saw it with the mv64xxx (Allwinner) and omap (Beaglebone) drivers.
From a quick look, it seems like quite a few others have the same
problem.

>> on some random device to return an arbitrary value in the first
>> byte (and nothing else).  When this happens, i2c_smbus_xfer_emulated()
>> will happily write past the end of the supplied data buffer, thus
>> causing Bad Things to happen.  To prevent this, check the size
>> before copying the data block and return an error if it is too large.
>
> Good catch, we were relying on the drivers too much here. I think the
> same fix is needed for the non-emulated case as well. Will have a look.
>
>> +			if (msg[1].buf[0] > I2C_SMBUS_BLOCK_MAX) {
>> +				dev_err(&adapter->dev,
>> +					"Invalid block size returned: %d\n",
>> +					msg[1].buf[0]);
>> +				status = -EINVAL;
>
> I changed this to -EPROTO as described in
> Documentation/i2c/fault-codes.rst.
>
> Applied to for-current, thanks!
>

-- 
Måns Rullgård
