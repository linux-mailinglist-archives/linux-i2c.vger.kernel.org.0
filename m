Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF1D177505
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Mar 2020 12:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbgCCLJA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Mar 2020 06:09:00 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60919 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727880AbgCCLJA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Mar 2020 06:09:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48WvQc1wlyz9sPR;
        Tue,  3 Mar 2020 22:08:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1583233737;
        bh=k64NAu+e8vHywQUsmy2fGAqOQOwSxRoTHJg5kp4QCCQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=UypcrMBp8z4HaDPrg6/sUKX90uFz55RsiEwy4YCz4HtwSBAOHDnc8kzhdwoNYREud
         cu1JyMV+ssNOyVlvixyo2/sxRrxy6SmWDHwjhYHMUZx68LXugkm5Eywy0WqibCrllE
         +V2jJ2lWVvo8cVWUlUGgB3q2eEegxr+EnGNrywoZGkm/5lyHdIbTrvlwTWlbpMmZ1q
         rxgPlXdymysKRtuFneCGX9QaIZDa3QdHnAs9nON4TIMOJTiRzNPo88crzoMT7KYIct
         QK6HOjqNxY+YyRpkrEylQUovQfTqguDlKuRVwvm4kWo1fsZEfOfwORevzcwFzgVgzg
         ROzxxIupN3Kqw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Wolfram Sang <wsa@the-dreams.de>, linuxppc-dev@lists.ozlabs.org
Cc:     linux-i2c@vger.kernel.org, debian-powerpc@lists.debian.org,
        Mathieu Malaterre <malat@debian.org>,
        Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH] macintosh: therm_windtunnel: fix regression when instantiating devices
In-Reply-To: <20200228170033.GB1130@ninjato>
References: <20200225141229.5424-1-wsa@the-dreams.de> <20200228170033.GB1130@ninjato>
Date:   Tue, 03 Mar 2020 22:08:52 +1100
Message-ID: <87y2shr8zf.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram Sang <wsa@the-dreams.de> writes:
> On Tue, Feb 25, 2020 at 03:12:29PM +0100, Wolfram Sang wrote:
>> Removing attach_adapter from this driver caused a regression for at
>> least some machines. Those machines had the sensors described in their
>> DT, too, so they didn't need manual creation of the sensor devices. The
>> old code worked, though, because manual creation came first. Creation of
>> DT devices then failed later and caused error logs, but the sensors
>> worked nonetheless because of the manually created devices.
>> 
>> When removing attach_adaper, manual creation now comes later and loses
>> the race. The sensor devices were already registered via DT, yet with
>> another binding, so the driver could not be bound to it.
>> 
>> This fix refactors the code to remove the race and only manually creates
>> devices if there are no DT nodes present. Also, the DT binding is updated
>> to match both, the DT and manually created devices. Because we don't
>> know which device creation will be used at runtime, the code to start
>> the kthread is moved to do_probe() which will be called by both methods.
>> 
>> Fixes: 3e7bed52719d ("macintosh: therm_windtunnel: drop using attach_adapter")
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=201723
>> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
>> Tested-by: Erhard Furtner <erhard_f@mailbox.org>
>> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
>
> Applied to for-current, thanks!

Thanks.

cheers
