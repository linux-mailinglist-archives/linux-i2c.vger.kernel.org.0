Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC8BE759D44
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jul 2023 20:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjGSS3f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jul 2023 14:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjGSS3f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jul 2023 14:29:35 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B700BB6
        for <linux-i2c@vger.kernel.org>; Wed, 19 Jul 2023 11:29:32 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso12298974e87.3
        for <linux-i2c@vger.kernel.org>; Wed, 19 Jul 2023 11:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1689791371; x=1692383371;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILx5BAS5UUBbrh8vCk/KPrRkJkoZzB20/Y5cauCrFOA=;
        b=txZNLovvSz7tkUe0GE8y1CmTI8Kr/Fq5clijqtcP5bLGKgeMrbS5P0e76kvcCadJIG
         pQ86BvYNc07UHVuPpqGgyktKTeXWu0KehkE9BaFL47aANnL8IDCotJCa/sTKtCC5uput
         /sUDdTnom9uMS30y7mvbHMP6php6LTXZPfIK7Gzsrda/VpNvQcBvicR+OzR+lSki3FdU
         tT3xSf6kZxdSct0wrDjXkqEVIDpyCjlSlT6KMojMtEShsahL6g6+R2d9itGw1uWFxZAA
         gTQ8bFUpEFqlhWze8d5G222gW7fDnIDRjf2ZhB7IrxGcX9JDACiSJ7LVlAh5V22tKXrg
         4aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689791371; x=1692383371;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILx5BAS5UUBbrh8vCk/KPrRkJkoZzB20/Y5cauCrFOA=;
        b=gkuqp7IbOmcmdJHMKHFaKHawEnDQm5JcXjvKoV1CZhgQX1js0gOuXEL8XKPDS6B45/
         lqlUBqj30cVjYqFiHojmtGFmSvVE21YN46p1oAu5Q3jostrdk1q67BONtmFlJ0ZM4uom
         jzYMYEtIiRKjnjICRGnKv4TQ5seWN77M2VNOWXD2h0JmgflGdJs9GpzfUWXfU+CVe5gI
         gpOCu34aOklFSiOKuTCZDayX4IoeiZoDjdvt9E36IXHoojV8vGm09Qzbfq2wujaPGaoD
         HMwEjHHr3Q2rK1vbgjFtF7RmTNo28Mnf0M6U7R9InqvOxQoGVepMFuAwGZVDPhMxdku4
         6iJQ==
X-Gm-Message-State: ABy/qLZstkvh7fFzfnBzAt2yoa8EYdGmMnbS2a8vNqGzRZv5OG88vQkC
        x5lKR15j98cXx5I9c3CcMDjnfeiDkuLa/JtMKtNi7A==
X-Google-Smtp-Source: APBJJlFIx6Rnf7u+Z15ZWK2MvsrC5i9Siqy9eUn5E0SKCuGfkgW75OqhftHF0kz6oNM7XkQJY81vdw==
X-Received: by 2002:ac2:4e08:0:b0:4f8:7614:48a5 with SMTP id e8-20020ac24e08000000b004f8761448a5mr568398lfr.66.1689791370788;
        Wed, 19 Jul 2023 11:29:30 -0700 (PDT)
Received: from localhost (p54ac5327.dip0.t-ipconnect.de. [84.172.83.39])
        by smtp.gmail.com with ESMTPSA id k23-20020aa7c397000000b0051d9dbf5edfsm3019727edq.55.2023.07.19.11.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 11:29:30 -0700 (PDT)
Date:   Wed, 19 Jul 2023 20:29:29 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: Wolfram have computer problems
Message-ID: <ZLgriSv3-v7Y6Px6@sleipner.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi everyone,

I have been asked by Wolfram Sang to send an e-mail to the list with the 
information the he have encountered some serious computer problems while 
travelling, and might be off the net for while. He is working on 
resolving the problem, but says he can't promise anything at this point.  
Worse case he might be offline for 4 weeks.

-- 
Kind Regards,
Niklas Söderlund
