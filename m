Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD9332D1AF
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Mar 2021 12:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236721AbhCDLXS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 4 Mar 2021 06:23:18 -0500
Received: from smtp-out4.electric.net ([192.162.216.192]:59466 "EHLO
        smtp-out4.electric.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239501AbhCDLXE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Mar 2021 06:23:04 -0500
X-Greylist: delayed 347 seconds by postgrey-1.27 at vger.kernel.org; Thu, 04 Mar 2021 06:23:04 EST
Received: from 1lHlvq-0001KT-TV by out4a.electric.net with emc1-ok (Exim 4.94)
        (envelope-from <aaron.jones@ftdichip.com>)
        id 1lHlvr-0001Qv-Ut; Thu, 04 Mar 2021 03:14:15 -0800
Received: by emcmailer; Thu, 04 Mar 2021 03:14:15 -0800
Received: from [188.39.184.230] (helo=glaexch1.ftdichip.com)
        by out4a.electric.net with esmtps  (TLS1) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
        (Exim 4.94)
        (envelope-from <aaron.jones@ftdichip.com>)
        id 1lHlvq-0001KT-TV; Thu, 04 Mar 2021 03:14:14 -0800
Received: from ftdi-VirtualBox.ftdi.local (172.16.3.24) by GLAEXCH1.ftdi.local
 (172.16.0.121) with Microsoft SMTP Server id 14.3.487.0; Thu, 4 Mar 2021
 11:14:13 +0000
From:   Aaron Jones <aaron.jones@ftdichip.com>
To:     <michael.zaidman@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <wsa@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Aaron Jones <aaron.jones@ftdichip.com>
Subject: Re: [PATCHv2 1/1] HID: ft260: add usb hid to i2c host bridge driver
Date:   Thu, 4 Mar 2021 11:14:06 +0000
Message-ID: <20210304111406.3482-1-aaron.jones@ftdichip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210219163644.2811-2-michael.zaidman@gmail.com>
References: <20210219163644.2811-2-michael.zaidman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain
X-Antivirus: AVG (VPS 210303-8, 03/03/2021), Outbound message
X-Antivirus-Status: Clean
X-Outbound-IP: 188.39.184.230
X-Env-From: aaron.jones@ftdichip.com
X-Proto: esmtps
X-Revdns: glaexch1.ftdichip.com
X-HELO: glaexch1.ftdichip.com
X-TLS:  TLS1:ECDHE-RSA-AES256-SHA:256
X-Authenticated_ID: 
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (b)
X-PolicySMART: 10711027
X-PolicySMART: 10711027
X-PolicySMART: 10711027
X-PolicySMART: 10711027
X-PolicySMART: 10711027
X-PolicySMART: 10711027
X-PolicySMART: 10711027
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Aaron Jones(FTDI-UK) <aaron.jones@ftdichip.com>

On Fri, Feb 19, 2021 at 06:36:44PM +0200, Michael Zaidman wrote:
> The FTDI FT260 chip implements USB to I2C/UART bridges through two
> USB HID class interfaces. The first - for I2C, and the second for UART.
> Each interface is independent, and the kernel detects it as a separate
> USB hidraw device.
>
> This commitadds I2C host adapter support.
>
> Signed-off-by:Michael Zaidman <michael.zaidman@gmail.com>

I've applied the patch, ran some tests with a UMFT260EV1A evaluation board, and found no issues with the functionality it provides.

Tested-by: Aaron Jones (FTDI-UK) <aaron.jones@ftdichip.com>
Registered in Scotland No 136640
This message contains confidential information and is intended only for the individual named. If you are not the named addressee you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately by e-mail if you have received this e-mail by mistake and delete this e-mail from your system. E-mail transmission cannot be guaranteed to be secure or error-free as information could be intercepted, lost, destroyed, arrive late or incomplete. The sender therefore does not accept liability for any errors or omissions in the contents of this message, which arise as a result of e-mail transmission. Future Technology Devices International Ltd has taken every reasonable precaution to ensure that any attachment to this e-mail has been swept for viruses. However, we cannot accept liability for any damage sustained as a result of software viruses and would advise that you carry out your own virus checks before opening any attachment.

Please note FTDI have updated their Privacy Policy.

Please click on the following link to access and review.

FTDI Privacy Policy<http://www.ftdichip.com/Corporate/PrivacyPolicy.htm>

-- 
This email has been checked for viruses by AVG.
https://www.avg.com

