Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 234A0626B88
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Nov 2022 21:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbiKLUOD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Nov 2022 15:14:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbiKLUOC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Nov 2022 15:14:02 -0500
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.148])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA05F5A7
        for <linux-i2c@vger.kernel.org>; Sat, 12 Nov 2022 12:14:00 -0800 (PST)
Received: (wp-smtpd smtp.tlen.pl 4821 invoked from network); 12 Nov 2022 21:07:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1668283636; bh=loH1W2wKycWcNMDjsgektwUyaNDFHlHO5th0/v6bRmw=;
          h=Subject:To:Cc:From;
          b=egiq0jsRFmHMDiNfMFvMUBgqj5BDQ5X+lvuVFIyXA5M/rniZMizsr4bhOjx8FAWNN
           x6aZk2v6sI5h3RYl/cblVuoQhVgCnoq80vOEwkpxVdlz5GoMgtdppIQSjy/eXJTy4a
           U/sC2ojO2XaPvQnNq/dTUPWoFMxtaGLR3J1wULns=
Received: from aaey149.neoplus.adsl.tpnet.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[83.4.128.149])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <helgaas@kernel.org>; 12 Nov 2022 21:07:16 +0100
Message-ID: <35cfe433-bafa-9aeb-20ad-2f275f585b6c@o2.pl>
Date:   Sat, 12 Nov 2022 21:07:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] acpi,pci: handle duplicate IRQ routing entries
 returned from _PRT
To:     Bjorn Helgaas <helgaas@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-acpi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Len Brown <lenb@kernel.org>, Borislav Petkov <bp@suse.de>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
References: <20221112002023.GA764787@bhelgaas>
Content-Language: en-GB
From:   =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>
In-Reply-To: <20221112002023.GA764787@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 13e9072270332344864b56994e464f72
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [QbNF]                               
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W dniu 12.11.2022 o 01:20, Bjorn Helgaas pisze:
> [+cc Jean, linux-i2c]
>
> On Sat, Sep 17, 2022 at 11:09:44AM +0200, Mateusz Jończyk wrote:
>> On some platforms, the ACPI _PRT function returns duplicate interrupt
>> routing entries. Linux uses the first matching entry, but sometimes the
>> second matching entry contains the correct interrupt vector.
> Rafael, Jean, what do you think about this?  It seems like kind of a
> lot of infrastructure to deal with this oddness, but I'm not really
> opposed to it.
>
> This is in i2c-i801.c, which seems to have some support for polling;
> maybe it could make smart enough to complain and automatically switch
> to polling if a timeout occurs.
>
> Or maybe we scan the entire _PRT and let the match win (instead of the
> first as we do today).
>
> Or ...?
>
> Google finds a lot of hits for "i801_smbus" "timeout waiting for
> interrupt", but I can't tell whether they're a similar _PRT issue or
> something else.
>
>> This happens on a Dell Latitude E6500 laptop with the i2c-i801 Intel
>> SMBus controller. This controller was nonfunctional unless its interrupt
>> usage was disabled (using the "disable_features=0x10" module parameter).

Hello,

I have prepared a lean patch that only prints a warning when there are
two matching entries in the table returned from _PRT (I will send it in the
next e-mail). Perhaps it could be merged and then after a release or two
it will be known how widespread this problem is.

Greetings,

Mateusz

