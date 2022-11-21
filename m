Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E8F631D0C
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbiKUJmJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiKUJmI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:42:08 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7332A92B45;
        Mon, 21 Nov 2022 01:42:08 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id k15so10851359pfg.2;
        Mon, 21 Nov 2022 01:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kq+XXThWPqKCp1nTLkhYhNaA9lJwpFLK+mGfpV+1NAo=;
        b=QLgTrvY6YjT5QUZizmIidvb3W9fUG74MTLFKYk/6/HbJ9xXvRL6aFwJkVrXJu4mnoV
         2WPa+NINo9d9t0ZlUVGQU/Rx40ZRe9pK7tqRYiP31ie1sNI2zdAKH+MV/aq+jlFRXwlU
         NXLPBAEAeugJKvHi1Yx+Z+QleTbtrnl3hdU/lvLdduYGn0fXvjPBHvKUUtbjomDRCrh/
         HTfo4Tr3yywrFJZLaH0INhfTJc3fu9Lm8FdmM4S+hPO8qU1KtxuzgQsluefhLBmXDxGJ
         OPrghmDi7TkR0CwClMFMUmJuYIU8zncZuswbV9DUFfl205n1AmmR7rqeyLxtgCkbwPdo
         09uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kq+XXThWPqKCp1nTLkhYhNaA9lJwpFLK+mGfpV+1NAo=;
        b=F28cinqNfAcS73dGh9/uSUMPmFMyllxPyDk3E6sim9D5TSavsvkFzbuHTDJeoBX6Gc
         BQmw/Kixgdc+aQJ6j0d4W44Hfk4Vzjdd8DVoJ0pb/9cSjQsAOSRzy/92TzV7/YKgrdgn
         1GZZeONBvLpQrnPqGB1i6PKDHMeOmLfBmAuG8V0sJSn1Co0WCYuxbl4iqUnZsv22qDfT
         MMdvawrzALwXR8YmNviJYhJweKrJBCMM04PWhIMWU+LUcBafSgakZHo3fn2NeFpMLs29
         QIymnjKlwPkB7dcxe/tHge7PlBTzEJ2BiVh4lDiZi9o/2eY1DRQ3GrAqXAt0n0j46o2o
         pwQg==
X-Gm-Message-State: ANoB5pltCuYTHnybtGlMcAz80FD5NYXYFXVeWHESgiEnm+W2vokZmFk9
        mqoq02rjNKyIsra+AtLK9l0=
X-Google-Smtp-Source: AA0mqf6VIO7rFxzMFasAd9F4D/g9nUrLRaseElq3s5WsER7MQ0o7O6nW7ocLtgQNk0lAXDUWRMgPEA==
X-Received: by 2002:a63:4551:0:b0:46f:b030:4011 with SMTP id u17-20020a634551000000b0046fb0304011mr17423810pgk.277.1669023727782;
        Mon, 21 Nov 2022 01:42:07 -0800 (PST)
Received: from ?IPv6:240b:c020:461:8350:394b:7d0:c360:6914? ([240b:c020:461:8350:394b:7d0:c360:6914])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902e80e00b00186c5e8a8d7sm9344091plg.171.2022.11.21.01.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 01:42:07 -0800 (PST)
Message-ID: <74fe22cf086edf567059051945dbb253d433aba0.camel@gmail.com>
Subject: Re: [PATCH 405/606] media: tuners/qm1d1b0004: Convert to i2c's
 .probe_new()
From:   Akihiro TSUKADA <tskd08@gmail.com>
To:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org
Date:   Mon, 21 Nov 2022 18:42:02 +0900
In-Reply-To: <20221118224540.619276-406-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
         <20221118224540.619276-406-uwe@kleine-koenig.org>
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
