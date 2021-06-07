Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD4C139D2B7
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 03:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhFGBtw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Jun 2021 21:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhFGBtw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Jun 2021 21:49:52 -0400
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA34DC061766
        for <linux-i2c@vger.kernel.org>; Sun,  6 Jun 2021 18:48:01 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 7142A42762;
        Mon,  7 Jun 2021 01:47:57 +0000 (UTC)
Subject: Re: [PATCH v2] i2c: i801: Ensure that SMBHSTSTS_INUSE_STS is cleared
 when leaving i801_access
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.de>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <cefbeb76-5f7f-036b-fa0e-1e339d261c35@gmail.com>
From:   Hector Martin <marcan@marcan.st>
Message-ID: <399040d5-7310-03e3-9963-c8bdf4f65913@marcan.st>
Date:   Mon, 7 Jun 2021 10:47:54 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <cefbeb76-5f7f-036b-fa0e-1e339d261c35@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 06/06/2021 22.55, Heiner Kallweit wrote:
> As explained in [0] currently we may leave SMBHSTSTS_INUSE_STS set,
> thus potentially breaking ACPI/BIOS usage of the SMBUS device.
> 
> Seems patch [0] needs a little bit more of review effort, therefore
> I'd suggest to apply a part of it as quick win. Just clearing
> SMBHSTSTS_INUSE_STS when leaving i801_access() should fix the
> referenced issue and leaves more time for discussing a more
> sophisticated locking handling.

>   out:
> +	/* Unlock the SMBus device for use by BIOS/ACPI */
> +	outb_p(SMBHSTSTS_INUSE_STS, SMBHSTSTS(priv));
> +
>   	pm_runtime_mark_last_busy(&priv->pci_dev->dev);

Yup, I was thinking of suggesting just this part if the rest of the 
patch were deemed more controversial. Thanks :)

Reviewed-by: Hector Martin <marcan@marcan.st>

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
