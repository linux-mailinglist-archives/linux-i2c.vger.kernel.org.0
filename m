Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E13A1631CFA
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbiKUJkI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:40:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiKUJkH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:40:07 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CEB6A767;
        Mon, 21 Nov 2022 01:40:06 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id n17so10632835pgh.9;
        Mon, 21 Nov 2022 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kq+XXThWPqKCp1nTLkhYhNaA9lJwpFLK+mGfpV+1NAo=;
        b=A/ouYF42v1B4ugx/IUsBugZZ7voMN9PWkRFMFxTdVCilR7XgXjjq/sKHObA2ilbMIJ
         xNzVcPYY1YzRK6tnNww4dWnL31WStFYLt2WVZfnYcRJ1fgjaNSyTMdrZsppp0OjDkDau
         AZhn9SaD17JnDjfSIeR8RLZrCdU5ZF52Y6ddtArow0rSOw3uzlobVtpLmOUtNxvGKAy9
         A3wBer8Eph5iRhVRAB3JYnQYfY7ynG4kOMKt5Hf4PuICp9K/Wf4io8AJa4qHjnANqgry
         rsuoEHt3QDRUcs8MKrNNlWtKXHiZj2yZudeW3rjs0qbOoN/KPoWZ+QpNS7W3DaNeZgEs
         IhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kq+XXThWPqKCp1nTLkhYhNaA9lJwpFLK+mGfpV+1NAo=;
        b=LXa3PkcxmO+turv3bTQz5iguQeZLTYwf2rTDFoGlTWcaT+GdyhUgDxQCjZLYOPpCxS
         +hWB53sNLES9vYH/Est6Ocw81ZoyV+pscfqDAO0kgj3z/bUyoDvdsyrtb+M8fstfWiJv
         2CGiB31n+MPT/uQbYX0GFV51qHKR+UmwTvE9YJebByTNpzfxFSjnE0BEiznXYL7SzgQL
         VIUOy2TRLK3tf9ITWVqn47FdRXKabRTy4HlWSGP1GleH3p2PS/Qgl01XIkUwpEp1AwFH
         8VXd0ylQLSn9OdDt3ady1B/VMRvIGkQQRQOEgA5XDvKQai7y5L0ZsrR4dupmK2ALLo3N
         bJtg==
X-Gm-Message-State: ANoB5pkifKWouZiNvBLJVWf9iwh35V0/LhPy3iAvRTu6raeGSXJapeDc
        yAIGnr7MKy77waH6mx6ompU=
X-Google-Smtp-Source: AA0mqf6LuBHwZYwxG9GjAFQnAw7TBvF9IrCExmM89uaNnpdRARI9/s3y0pAgHVUnR2Lf8SZw/0JROA==
X-Received: by 2002:a63:1f63:0:b0:460:ec46:3645 with SMTP id q35-20020a631f63000000b00460ec463645mr17374054pgm.92.1669023605672;
        Mon, 21 Nov 2022 01:40:05 -0800 (PST)
Received: from ?IPv6:240b:c020:461:8350:394b:7d0:c360:6914? ([240b:c020:461:8350:394b:7d0:c360:6914])
        by smtp.gmail.com with ESMTPSA id g197-20020a6252ce000000b0056e0ff577edsm8212897pfb.43.2022.11.21.01.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 01:40:05 -0800 (PST)
Message-ID: <f2b427bebe675a0efed15a74ea1cb947bf3007ad.camel@gmail.com>
Subject: Re: [PATCH 404/606] media: tuners/mxl301rf: Convert to i2c's
 .probe_new()
From:   Akihiro TSUKADA <tskd08@gmail.com>
To:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org
Date:   Mon, 21 Nov 2022 18:40:02 +0900
In-Reply-To: <20221118224540.619276-405-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
         <20221118224540.619276-405-uwe@kleine-koenig.org>
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
