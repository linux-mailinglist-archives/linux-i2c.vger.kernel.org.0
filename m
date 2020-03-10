Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE55517F5A3
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 12:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgCJLFO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 07:05:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44559 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbgCJLFO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 07:05:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48cC136dCfz9sRY;
        Tue, 10 Mar 2020 22:05:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1583838312;
        bh=ZJ7IV/uz2A9fmpd77KEpSm4KBcaZsOEeo3TwkHBjkGk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Ph5xDCVPgFixmglhr7cuEaZr+MT0cIgvDwV5ros2gtValez+wIrPmAzmwLe57qRoJ
         86EmGAmB/zyhTo2tLn5ekJ2K/sFwmHGjpioatMhggYs6N3IDtIkWjjYPe5aIXp4huj
         yeAQ1B6agFBDhW7XUiYEbEKn7VfZKDQjZ6InQktoHx4MuQA/14Rb7wfQsvz+/UaGiJ
         MMmH/0nGy/nTafG5/Iqm541XDAL/r47GV0mPOVGSbmSY4CKVknh6CuIztGK5cRxhUm
         mKznpuvziE4C9eBUMAYFmX2dw8Rmfml/NzGRM9yCyLuw0HvVJl3QHpIU+S0dvvxGyG
         CklZzhEQouoSA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Wolfram Sang <wsa@the-dreams.de>, linuxppc-dev@lists.ozlabs.org
Cc:     linux-i2c@vger.kernel.org, debian-powerpc@lists.debian.org,
        Mathieu Malaterre <malat@debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH] macintosh: windfarm: fix MODINFO regression
In-Reply-To: <20200310091155.GA1987@ninjato>
References: <20200303125046.5157-1-wsa@the-dreams.de> <20200310091155.GA1987@ninjato>
Date:   Tue, 10 Mar 2020 22:05:09 +1100
Message-ID: <87wo7sii6y.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram Sang <wsa@the-dreams.de> writes:
> On Tue, Mar 03, 2020 at 01:50:46PM +0100, Wolfram Sang wrote:
>> Commit af503716ac14 made sure OF devices get an OF style modalias with
>> I2C events. It assumed all in-tree users were converted, yet it missed
>> some Macintosh drivers.
>> 
>> Add an OF module device table for all windfarm drivers to make them
>> automatically load again.
>> 
>> Fixes: af503716ac14 ("i2c: core: report OF style module alias for devices registered via OF")
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=199471
>> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
>> Tested-by: Erhard Furtner <erhard_f@mailbox.org>
>> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
>
> Michael, I can take this via I2C again, if you ack it.

Thanks, done.

cheers
