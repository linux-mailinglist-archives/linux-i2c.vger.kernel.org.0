Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDDFE4472D2
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Nov 2021 13:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234600AbhKGMMF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Nov 2021 07:12:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234367AbhKGMME (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Nov 2021 07:12:04 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39CC3C061570
        for <linux-i2c@vger.kernel.org>; Sun,  7 Nov 2021 04:09:22 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id z200so10797785wmc.1
        for <linux-i2c@vger.kernel.org>; Sun, 07 Nov 2021 04:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=wVFvHaltuCdx04Vox0N+2yrF7pXxU3pLVBVlZV9/Zco=;
        b=R4vK7lK+4iWgxHLZZHglMqQ+Cy0eX0TbRIdwHHhDAQhn+MfLgdN4OuzqkK1gG8XMJO
         vFfUb7+8PVl6b/paT3Aqw8WxkZJZ5Zfgor4ZdQMRSQPWpIVmV8uGfCo82nrC3w8nqXy+
         I6BDBQQbVPppwJp7CB74RRMANhKz8swUf0EJqsFpzw0BFGrzmJ2uAYcwwkk6OptV4d3R
         5LPwPKTBp1eWkQlCChT2Tpz8P6EHQnICpjYwVW2NdjChS6SwRwHjrP0d0aY4skD8fYhS
         WpwXOjLmMWJEtiPgmml7h8QLPrT57kJZbPA7HJPZNt66vhd4VL2vQSmVxfG85QBAm3Xb
         ZYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=wVFvHaltuCdx04Vox0N+2yrF7pXxU3pLVBVlZV9/Zco=;
        b=OfSJau2L5L+YliJ2vrIXrqtDrOBif91SCbeEA1Fy5fm7EW2qsv7vI2ZlFtmEQcDswV
         WGI8v4EpEtufsaaOYB/Ux8khoBj4rGaEJQ3nF3tojhXt3f/+R6szC61jzvfVlPXJaJab
         CoDCBXBjN8x8nvZMPrf5PDidTMO3O5oXrCWoUd13hK0mLLp3a98Jn6Ldsu/nubuP898v
         6UjKZZXR9sXkGQp77eJzyo96oz1oHF/uSudkgoFBsY5V1+2DRTj8zWR/fAdxMPa8sbNq
         ++3k45Z8/36tvUU7vvHvGAoDowVp6dK2924vZq9L948KULXK4u4JvdygWnDEMPRM1uhJ
         JPfQ==
X-Gm-Message-State: AOAM532Tp05XHT0lqePoyJCQD+XUb+SMzy6h2D3U50FKR4kbS8N9jgdm
        nsTiIvqK775Lm2nnarNBrEk=
X-Google-Smtp-Source: ABdhPJyyZJjE5z9sbyDxXD39/AXC+FVTbs+N2HTlJM+3246JM/tMtz6dbR+LYvhiVysCvrJ9Gmk11g==
X-Received: by 2002:a1c:447:: with SMTP id 68mr45025554wme.69.1636286960768;
        Sun, 07 Nov 2021 04:09:20 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:1bb:8c0a:764c:b963? (p200300ea8f1a0f0001bb8c0a764cb963.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:1bb:8c0a:764c:b963])
        by smtp.googlemail.com with ESMTPSA id q18sm16614233wmc.7.2021.11.07.04.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Nov 2021 04:09:20 -0800 (PST)
Message-ID: <bd689d60-f197-3509-f259-789aae28d88a@gmail.com>
Date:   Sun, 7 Nov 2021 13:09:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Did "i2c: i801: Add support for Intel Ice Lake PCH-N" get lost?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

According to patchwork history here the patch was applied to for-next on Oct 17th.
https://patchwork.ozlabs.org/project/linux-i2c/patch/20211001172154.15660-1-andriy.shevchenko@linux.intel.com/
However I don't see the patch in i2c/for-next and linux-next.
Did it get lost somewhere?
