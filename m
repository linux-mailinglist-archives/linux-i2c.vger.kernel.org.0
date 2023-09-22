Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2EE67AB005
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 12:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233435AbjIVKzk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 06:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjIVKzj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 06:55:39 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56325AC;
        Fri, 22 Sep 2023 03:55:33 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3226cc3e324so1113775f8f.3;
        Fri, 22 Sep 2023 03:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695380132; x=1695984932; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=janjVMwgJq+oTkf1VaERpcS2q+YlzGOoJGgDx48XVcM=;
        b=WVr8opDJcFRUyvCnSQZZjAq21vD9iJBSyXDD9e7QzoYlzRbAaIhH6jVcLlPijPz6Sr
         r4bJXIQb7A6vm/FGv0r3Shv3zJzcUKD+mDeN24RwNNiMhbA8MbppdMq22Zu9QxRB8LkY
         dNyfTze7JoRGdW10s8Ynchg0bAoapd2Nfxiwa60Xalzm3S3Qd4YFoAPKb6CxhWAtKYfn
         2MzD/jh3awoj+jNMoaMV43XyEyPHlccXOE3iyzaZLgN9vMGMTZDJTZfmOtchilOKMwCd
         Sw3ZiUqQQ+rqbSEsy0dLzs44PtxdAadq4Dc5ze/58TC/INCv6Hj31Jg4Fid1WRItIQc1
         YjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695380132; x=1695984932;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=janjVMwgJq+oTkf1VaERpcS2q+YlzGOoJGgDx48XVcM=;
        b=vc7HKNyUZYw99JkW1SDoZHcILCiZvkc+6Fe9X62ap7iZSlEMhT6Z1sBCbVSQrx/qJ4
         ktV7CDLJDlLfQeQwN+LvsMCFVWZJ1FR5E4p1UWgac5e7/nPOE20xU4P8NBjORLMk0DUW
         kR6KsHO401ni5uiM1HjwaB+gWImEqd5jegeXNwDhmfLONoQogCUBaQGpiJNLTHJwruk/
         kr7CCl2tsqxUspEvKHU85sAY/BxIKQGGAGsKOUx0rxR32TPKq1IH10PmVE2TU3w4Poh/
         JU4Z4TUqWBitVvOcsTxZW3Ig/28izM3UMPDfn5RrWW3ii/5cdfPfLzx5bf/XKIs/CL1H
         u5eg==
X-Gm-Message-State: AOJu0YwXn3FffpEi8qRF7zTfmcwbK2VRgGoLFz04ByG9D6G0gvv7s6jC
        gzr4t5G2vAZVPLpDjYjbtVyldHVOTSI=
X-Google-Smtp-Source: AGHT+IE3y58W1GV+NXk6RRZ6uYHM9TGQSFg317edLswgtYEGe9J4vHXrgOJUa3VtpKv6WLn4dbiTUw==
X-Received: by 2002:adf:fdc3:0:b0:321:6388:bccb with SMTP id i3-20020adffdc3000000b003216388bccbmr6865512wrs.21.1695380131561;
        Fri, 22 Sep 2023 03:55:31 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9589:7c00:b10e:5fd8:e6fa:a54? (dynamic-2a02-3100-9589-7c00-b10e-5fd8-e6fa-0a54.310.pool.telefonica.de. [2a02:3100:9589:7c00:b10e:5fd8:e6fa:a54])
        by smtp.googlemail.com with ESMTPSA id a3-20020a5d5083000000b003198a9d758dsm4190330wrt.78.2023.09.22.03.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 03:55:31 -0700 (PDT)
Message-ID: <9f72dd81-7caa-49de-b776-55851a9eeac7@gmail.com>
Date:   Fri, 22 Sep 2023 12:55:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        Marius Hoch <mail@mariushoch.de>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: i2c: i801: Force no IRQ for Dell Latitude E7450
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Just became aware of this patch because Wolfram listed open i801 patches.

http://patchwork.ozlabs.org/project/linux-i2c/patch/20230514103634.235917-2-mail@mariushoch.de/

I understand that BIOS is broken and assigns an interrupt to the SMBUS PCI
host controller that is actually used by another device.

Dealing with internal low-level flag irq_managed in a device driver seems
to be fundamentally wrong. Also we may be in trouble if pirq_disable_irq()
should ever be called for the SMBUS host controller driver with
irq_managed being set and irq set to the one of the other device.

Not sure whether setting pci_dev->irq to 255 before calling pci_enable_device()
would help. As this isn't an i2c/smbus issue but a PCI/BIOS issue, maybe
the PCI folks have an idea what the least ugly quirk could be.

And to ask the obvious question: How about a BIOS update from DELL fixing
the broken interrupt assignment?
