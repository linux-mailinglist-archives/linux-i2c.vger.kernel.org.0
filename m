Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78D946D5048
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 20:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbjDCS1j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 14:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbjDCS1h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 14:27:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B7A2139;
        Mon,  3 Apr 2023 11:27:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8413461D30;
        Mon,  3 Apr 2023 18:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B65C433D2;
        Mon,  3 Apr 2023 18:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680546454;
        bh=WCjt2Jv/YW91V4m2oQrs7DJ0U7kfjPlwg2HS+dwFJMU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qTSuFeV/ddExWkrit1fhvuaqyysRalSl+c5u+xVaLct1OfS8y1W9IX7BqLqlZQjPV
         4UTtK8W5xMYYR6g7E0aJ81X2NTH9ZMsAp4pYFNcyq9+m9VHtCyJhg25c/a7oLSvx25
         lfUmJ7JOvNC1s3JB7Egsb0K6n8Rd7nIQyKt00Kp4B3noI+vlm89FVFdFu4SOHh7ZoP
         zsPLddqwka9U+KlUr83K2A88bpd0Bup5rvNNuScRQdqvy9l9S23yFUnU8979SZ3MzI
         XvCzo+1l+n2AFXVvguS5lnqUOWqDQRn+DoWXZkWXDaeg/1+oqSOzuzdpuLw7n7iSMU
         7SQQP8B+rjupA==
Date:   Mon, 3 Apr 2023 19:42:46 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Daniel Matyas <daniel.matyas23@gmail.com>
Cc:     linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Subject: Re: Creating a driver for MAX31827 temperature switch
Message-ID: <20230403194246.10a56b59@jic23-huawei>
In-Reply-To: <ZCn0KeOQFJclqiAK@daniel-Precision-5530>
References: <ZCn0KeOQFJclqiAK@daniel-Precision-5530>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 3 Apr 2023 00:31:21 +0300
Daniel Matyas <daniel.matyas23@gmail.com> wrote:

> Dear Kernel community,
> 
> I am developing an IIO driver for a temperature switch, which communicates through I2C at Analog Devices Inc.
> 
> When implementing the event handling for the comparator mode of the device, I faced a problem: I don't know how to differentiate the underTemp event from the overTemp event. To understand better, I suggest you check out the device's data sheet for Address map (page 12), Configuration Register Definition (page 13) and OT/UT Status Bits and ALARM Pin Behavior (page 15) - https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31827-MAX31829.pdf
> 
> I had the idea to make 2 channels with the exact same attributes, but with different indexes, so that I can store the overTemp related events on channel 0 and underTemp related events on channel 1. Even so, I don't really feel like this is the right solution. Can anyone give me some advice on this?

If it's just a question of over and under temp, I'd imagine these map to two
different directions of IIO event. You can have one channel with RISING and FALLING
events on it.

e.g.
https://elixir.bootlin.com/linux/v6.2.9/source/drivers/iio/adc/max1363.c#L451

The place we run into IIO limitations is if you have two events in the same direction
(warn and critical for example)  When that happens it is almost always a device
that fits better in hwmon anyway so we've never figured out how to enable this sort
of thing.  Doesn't seem to apply here though.
> 
> Also, I was suggested that I convert my driver from IIO to HWMON. Do you think that this is needed?

No obvious reason why this benefits from being in IIO so I'm agreeing with the others who have
replied that this looks more suited to hwmon.

Jonathan


> 
> Yours faithfully,
> Daniel Matyas

