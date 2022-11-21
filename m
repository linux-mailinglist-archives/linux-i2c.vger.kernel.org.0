Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57BD9631CF7
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbiKUJic (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbiKUJia (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:38:30 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A66513F8D;
        Mon, 21 Nov 2022 01:38:29 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id q71so10628928pgq.8;
        Mon, 21 Nov 2022 01:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kq+XXThWPqKCp1nTLkhYhNaA9lJwpFLK+mGfpV+1NAo=;
        b=UZJhVagQ76Rb8uHo275DlZTIw+tE053Rxn8VJvNCyw8XfUUdjZi1Hkeb9VQuoZwitt
         99YUg4n/8uPrQuaTJhDxBaqznMc6QzhR2erJH1Wi93LHSJNY+TA0C2K9/G9yl6eJueXZ
         1+42luom0Lj1cF/DHns545S3G48FIGvw7IbCckzdOsYddpMK4mCSCPJBa2N7+6eSMyg5
         btHQAmSG4C54JAQaFkM5oicGGY4/5mnYFUOzoiJB3/kWzB1CADR8Vkc84SfTZHMXnf+/
         lrRfIxcEv3KAY9ugvUrJ0eKr508KClhOZRQCbQoY2wPrxAIWWhkBId8oj54YxxzOLONV
         z4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kq+XXThWPqKCp1nTLkhYhNaA9lJwpFLK+mGfpV+1NAo=;
        b=kjuHvoJFDuU0pp9S1+B8gFEPc2hHBcRy91ZZ4nC/0U3lyW691xWnuaGHe/nAp4LG4u
         aG2fgXqT+UOKT5wedf+vUMd2U1pZ6zaHkIljPMZZIjqJUozgq5AuziHGRLGq02t1wsXx
         pwtdhrgRE2Klq/kdQrVN5w60XEnMYfqj2YhrkWVASRJmCLtY3z7GOCbaYlDOrgueBQwr
         9RMhEigfHYFi1vk+siV0S85L3qQgjBO2N1D8Qa8Uv45+SkmiVbSPDdvU/3DhugNBJqVj
         7ARsIe1KpSGSWHpgFzccSPARzhe8l7qxBwOOHCI7wFhJY1y/kf6b/j6vuxCgA31+1uXW
         vq1g==
X-Gm-Message-State: ANoB5pl0hjQSAneguJy4uvToo6A7mQZhK5sPorIVspW1Y28wxNzwg8yJ
        7tzjBnJrtZMz2NmwvNIFHZ/HN9ss8J4=
X-Google-Smtp-Source: AA0mqf5NGKyl+2weHXO/h3oTXiA0GFGrkWLsDx5rIUppKlHydI44WQ/n7rkCOkNxpdLsSJ27/x8Ajg==
X-Received: by 2002:a05:6a00:1d8e:b0:56c:c538:f100 with SMTP id z14-20020a056a001d8e00b0056cc538f100mr486402pfw.58.1669023508703;
        Mon, 21 Nov 2022 01:38:28 -0800 (PST)
Received: from ?IPv6:240b:c020:461:8350:394b:7d0:c360:6914? ([240b:c020:461:8350:394b:7d0:c360:6914])
        by smtp.gmail.com with ESMTPSA id x11-20020aa79acb000000b00561d79f1064sm8271733pfp.57.2022.11.21.01.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 01:38:27 -0800 (PST)
Message-ID: <fb0c49c5b45afdc83d3ad5ddb8e48e7059eca869.camel@gmail.com>
Subject: Re: [PATCH 320/606] media: dvb-frontends/tc90522: Convert to i2c's
 .probe_new()
From:   Akihiro TSUKADA <tskd08@gmail.com>
To:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org
Date:   Mon, 21 Nov 2022 18:37:53 +0900
In-Reply-To: <20221118224540.619276-321-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
         <20221118224540.619276-321-uwe@kleine-koenig.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
User-Agent: Evolution 3.46.1 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tested-by: Akihiro Tsukada <tskd08@gmail.com>
