Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F757631D18
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbiKUJoS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbiKUJoN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:44:13 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C1463D7;
        Mon, 21 Nov 2022 01:44:12 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id k5so9947266pjo.5;
        Mon, 21 Nov 2022 01:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kq+XXThWPqKCp1nTLkhYhNaA9lJwpFLK+mGfpV+1NAo=;
        b=I8VawbMRUWMC2zkEX+jYnP6T7ilDzoIhvvF4OS2qzXAqh+vo2Ds0Mm1pbCpIbjq+vg
         eiQ60ojn3+8EWBnDRohBcLpyBFvwyEhZ86htTgx/nevipapq8VGmJj6PUej5Ssb9MGJA
         nwMVJJ+ezQKzGN8xndVStpnj2VR7hrOn09UM/6bMVRCWAEPRJUAWpEVTUFCTRlJcQ7k9
         ATB+rRpX7rZMouAn6uqbY0g9Hfpe6dePT/QmB4ltO61Z1e0yQO79/tTIimY0WWDlVLvc
         XtcFb+LLrz6pwIoNaH3kXssNNZXCqBT9LkBbjB5GeEUNtrsO4llLDXJScU9cMF82FnMg
         bvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kq+XXThWPqKCp1nTLkhYhNaA9lJwpFLK+mGfpV+1NAo=;
        b=0leNnmSYSpFxwXc0YS2OZ3Qa9ZKviEWBk1aeYHvPWrKWqYwbwotAeJ8SKTEEczQip4
         iAmI3m8Ee+6tj5sm87VVxMk/5BdeNOZu8GOAb7k3NqO1Q3r2fu1srwMqCsIR83z+5etc
         +k7HM5i6psRYUzNs4jOl8r6Bxl2QB/19bnDp+Yl+PMimxNqaXOyXJZ0cQxAnSG4Qke3g
         uqvnJLQulGHtxnseggkVa4hnFWE7LThfBQcvMFgO6r4NZza1rIVe/Q4Lvu+VO/7iMYf9
         H6Z8lRDPSVdFb/u2+FYO2H5cf3f0NkO6/BaBGL3cLQBzwMyj2jCVx40ymi/6c7N+NTTe
         5avg==
X-Gm-Message-State: ANoB5pkEZZ60ls1HPmkTaNjkmY/MJ/4HHsukwK3JdKE2ry74WqLpdjF1
        pY3AQWZpjOoZMrx4IfWIcVG5jIb+jy4=
X-Google-Smtp-Source: AA0mqf7VUZP5WL8w0KYpuEylBqxVM+R+qsCToD3i516YT8qUkPqvdnh9YozzqmbulM7I5w6ktU2qnA==
X-Received: by 2002:a17:902:bd42:b0:188:ca57:8945 with SMTP id b2-20020a170902bd4200b00188ca578945mr1615541plx.116.1669023851841;
        Mon, 21 Nov 2022 01:44:11 -0800 (PST)
Received: from ?IPv6:240b:c020:461:8350:394b:7d0:c360:6914? ([240b:c020:461:8350:394b:7d0:c360:6914])
        by smtp.gmail.com with ESMTPSA id d12-20020a170903230c00b0017e9b820a1asm9431678plh.100.2022.11.21.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 01:44:11 -0800 (PST)
Message-ID: <8881e8428d765583e0dff7e90fa3e2c92392fc5a.camel@gmail.com>
Subject: Re: [PATCH 406/606] media: tuners/qm1d1c0042: Convert to i2c's
 .probe_new()
From:   Akihiro TSUKADA <tskd08@gmail.com>
To:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org
Date:   Mon, 21 Nov 2022 18:44:06 +0900
In-Reply-To: <20221118224540.619276-407-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
         <20221118224540.619276-407-uwe@kleine-koenig.org>
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
