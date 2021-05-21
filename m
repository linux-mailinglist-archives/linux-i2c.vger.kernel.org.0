Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48EC938D064
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 23:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbhEUWAu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 18:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhEUWAu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 May 2021 18:00:50 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592EAC061574
        for <linux-i2c@vger.kernel.org>; Fri, 21 May 2021 14:59:25 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id l11-20020a05600c4f0bb029017a7cd488f5so5250000wmq.0
        for <linux-i2c@vger.kernel.org>; Fri, 21 May 2021 14:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=9UQ/+9eroAZ4Xj9eThxyzW2NOk5V/FepQVQDmfhguTo=;
        b=e+a0rGSZkwyWN++VTlo1i/cRDQpcNvG9sDRyxvcALtxmtrU3vvnrTh6ds3ZXHrC1ZJ
         rRjA6G+qe0jc2FT2XmsND5XDlbmz0iIiC7dKdO/GvEsMHWaDOH+BnP/yUK15ZMFZu96z
         TpZfzr+TYPuDPiN130U/ArHHS+JwFawrJ8RXSt73/L8cwpemRAax1k6sinKXkK9xOMkL
         H2vhxeZoYUAy1LQd0xZUjTdUh8rB2yb4CrzCrn51/Nhb7kvRx+fOaqor1ZG62ZOqLZbO
         8vmYoccYDxFwo4w9dbvgzogVLI2BF+8p0FAoJHyDs3zb/jLnWBInfqEWG38SaYTjZeD9
         AU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=9UQ/+9eroAZ4Xj9eThxyzW2NOk5V/FepQVQDmfhguTo=;
        b=CejVKawfSkvlFyoxRwtASQAHO5bDgE4MBbXxH7lQ8K3dre6EkXWVOjI0TAPGUvTVZN
         SRVQpi5NeeK3bu9haX5iWiq0q95w+Rz0alCrxPkcsGFanRw09PjblBH66oCwdluA4TG7
         dcq3oKVjPxis8DYf+j/1kBZXTc94tdJ7dzHAKTF9THM4FNVsKWapDF3C0MfystzJ7S2o
         UGR3VWO/bNpkeYxEMHG2+u0RPX+3ZUtFgqMVbVz10wcpl5ucYeAolkKHF4QEOeYVm6EL
         M/UUQZ/l3tCB/WxRt8GuHuVUbyIZtHjbg/MalKSVknEBECXEBICKGrRJFjusHKuwIM98
         3K4g==
X-Gm-Message-State: AOAM531JJANyurZ9wrs3CbOmhJ03pecfd3DFprVLsiWLjkkOq9BrnxA5
        EbGJKZfuDd8FUl3ZLZfVRiSxPC8GVyc=
X-Google-Smtp-Source: ABdhPJwhgdRmkU854S0dwAI+fRS/fSsDxWcmA7RqHHke/VqQ8ASQxILULatYhWh9TRYcDFCUt5OGCQ==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr10674671wmb.113.1621634363720;
        Fri, 21 May 2021 14:59:23 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:84e0:e04f:ac50:5090? (p200300ea8f38460084e0e04fac505090.dip0.t-ipconnect.de. [2003:ea:8f38:4600:84e0:e04f:ac50:5090])
        by smtp.googlemail.com with ESMTPSA id v11sm4075657wrs.9.2021.05.21.14.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 14:59:23 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/2] i2c: i801: Replace waitqueue with completion API
Message-ID: <561b74ab-b020-b0c7-c1ad-b7c3326245e3@gmail.com>
Date:   Fri, 21 May 2021 23:59:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Using the completion API is more intuitive and it allows to simplify
the code.

Heiner Kallweit (2):
  i2c: i801: Remove unneeded warning after wait_event_timeout timeout
  i2c: i801: Replace waitqueue with completion API

 drivers/i2c/busses/i2c-i801.c | 52 +++++++++++++----------------------
 1 file changed, 19 insertions(+), 33 deletions(-)

-- 
2.31.1

