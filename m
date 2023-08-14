Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6111377C2D4
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 23:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233037AbjHNVxo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 17:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbjHNVxM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 17:53:12 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA515171B;
        Mon, 14 Aug 2023 14:53:00 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bbf8cb61aeso30663075ad.2;
        Mon, 14 Aug 2023 14:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692049980; x=1692654780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ph6jaZNygycT+NmQDqvrcJyASoOlD1NZE1SWPIDmnUE=;
        b=CjlFlGLt2nV4v+VkWQOVwqOhiWkT9TUDLcyVPELByZQzZptpYai1y+UDeiXWC0Irxn
         8NXUv6nOyoUvUMQ6CVaLwDGSOiSxvzCUbeFuE+5T+8TWtQdlRxzhaacN59ei4DAnhj4X
         TudHl8X247+6067HY6UgDMZLuGV4RtlafmrHRtphlqDPOsdVetkpip31axOMbfCb/Rii
         UP+j4fnAHugT+l3N4etQifx241EBQoi8n7/Arw4XmeCxHlwLV810XsckWQj5ujgdJwrr
         x5A1W4pkn0Pednf2QzgoLWOYjVUKBeUXZ45PvUQjT9cex6cRe+bSnDxoqjw0m6nmJq1J
         Yncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692049980; x=1692654780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ph6jaZNygycT+NmQDqvrcJyASoOlD1NZE1SWPIDmnUE=;
        b=R+m7uMWpeJw9tPFAdmVW0g792fZwL2dNNW6dP1EbJpku47P2O1Pobowa6BW4l1FRbr
         AjFIr+TNzsy4haEHnT/CMsGg7W0ONe4A0790jswazPJfrn2JMIiUXX/ilsf+8BBjuxaY
         zduKNuOnQCa1wtwbHJHi69j4H03Vor6pCnHU9f+1BlAntGpNn6J/PGA5uu1KBMuHtHbH
         FCY6E7wPrjUv2gJefH6d7+wQtZ2xIcJ+yBGFb+P2xc0yVk5Am8XhGQ5PbRZmsjcUOSZd
         8GYcVTtF9l9Tuof9WjTrf4kNEc8S6lMlC8rGrONIoNYgw6ApL6nDpn+K7Xw2EnW8Lg5T
         IGgA==
X-Gm-Message-State: AOJu0YxJdKaZij7jwRnzkbyLHjov6UO7gscr1v9Pv679Gn3YWYt14lRP
        hP0TaCSzJSLZ7FEbQHgmImA=
X-Google-Smtp-Source: AGHT+IFUEOeLZ4GR9+X9bbRDKX6hp6Z0WTVJrqCQ6U7hZGq9AEniZfLSRTb//QafStFBM+rK5Y23Bg==
X-Received: by 2002:a17:902:dad1:b0:1bb:9675:8c06 with SMTP id q17-20020a170902dad100b001bb96758c06mr10342970plx.35.1692049980053;
        Mon, 14 Aug 2023 14:53:00 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:6c34:7c96:4b56:4eca])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm10056065plb.237.2023.08.14.14.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 14:52:59 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 2/4] i2c: mux: ltc4306: convert to using a pointer in i2c_device_id
Date:   Mon, 14 Aug 2023 14:52:50 -0700
Message-ID: <20230814-i2c-id-rework-v1-2-3e5bc71c49ee@gmail.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
In-Reply-To: <20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com>
References: <20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13-dev-099c9
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Switch the driver to use newly added "data" pointer in i2c_device_id to
streamline DT and legacy flows.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 637e25506490..17b9ed9ceef3 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -192,8 +192,8 @@ static int ltc4306_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 }
 
 static const struct i2c_device_id ltc4306_id[] = {
-	{ "ltc4305", ltc_4305 },
-	{ "ltc4306", ltc_4306 },
+	{ "ltc4305", .data = &chips[ltc_4305] },
+	{ "ltc4306", .data = &chips[ltc_4306] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltc4306_id);
@@ -217,9 +217,8 @@ static int ltc4306_probe(struct i2c_client *client)
 	int num, ret;
 
 	chip = of_device_get_match_data(&client->dev);
-
 	if (!chip)
-		chip = &chips[i2c_match_id(ltc4306_id, client)->driver_data];
+		chip = i2c_match_id(ltc4306_id, client)->data;
 
 	idle_disc = device_property_read_bool(&client->dev,
 					      "i2c-mux-idle-disconnect");

-- 
2.41.0.694.ge786442a9b-goog

