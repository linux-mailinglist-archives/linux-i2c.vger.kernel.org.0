Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41E38678905
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jan 2023 22:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbjAWVBm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Jan 2023 16:01:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232697AbjAWVBj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Jan 2023 16:01:39 -0500
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.148])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445BF24488
        for <linux-i2c@vger.kernel.org>; Mon, 23 Jan 2023 13:01:20 -0800 (PST)
Received: (wp-smtpd smtp.tlen.pl 28415 invoked from network); 23 Jan 2023 22:00:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1674507644; bh=HsCsStujFHgAKL+PQ3iGBl5rH7koMzT4zJAgvzGMNsc=;
          h=Subject:To:Cc:From;
          b=Xosrtd8e7aMynph/lG7d8QiLLgrHyI9I7WjonRrMOrh3cgu2KnE09wf0it3bzAzfz
           MjonPNUioRphrR5m9dM8eR/jJaVEnmyr7o0NvjFUUbTuYjIkHxwdQI/Fp07Ttnnddn
           n43z5twTakmh50IMOV1/CBivPv3cfbZ0Vvuiy9E4=
Received: from aafi207.neoplus.adsl.tpnet.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[83.4.138.207])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <helgaas@kernel.org>; 23 Jan 2023 22:00:44 +0100
Message-ID: <0113ca60-acf2-f4db-3230-959e9bb15726@o2.pl>
Date:   Mon, 23 Jan 2023 22:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 RESEND] acpi,pci: warn about duplicate IRQ routing
 entries returned from _PRT
Content-Language: en-GB
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Borislav Petkov <bp@suse.de>,
        Jean Delvare <jdelvare@suse.com>,
        Jean Delvare <jdelvare@suse.de>
References: <20230123203301.GA909338@bhelgaas>
From:   =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>
In-Reply-To: <20230123203301.GA909338@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 9348f459360cb981b391345357ad9bdb
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [8cM0]                               
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W dniu 23.01.2023 o 21:33, Bjorn Helgaas pisze:
> On Sat, Jan 21, 2023 at 04:33:14PM +0100, Mateusz Jończyk wrote:
>> On some platforms, the ACPI _PRT function returns duplicate interrupt
>> routing entries. Linux uses the first matching entry, but sometimes the
>> second matching entry contains the correct interrupt vector.
>>
>> Print an error to dmesg if duplicate interrupt routing entries are
>> present, so that we could check how many models are affected.
> It shouldn't be too hard to use qemu to figure out whether Windows
> uses the last matching entry, i.e., treating _PRT entries as
> assignments.  If so, maybe Linux could just do the same.
>
> Is anybody up for that?
>
> Bjorn

The hardware in question has a working Windows XP installation,
and I could in theory check which interrupt vector it uses - but
I think that such reverse engineering is forbidden by Windows' EULA.

Greetings,
Mateusz

