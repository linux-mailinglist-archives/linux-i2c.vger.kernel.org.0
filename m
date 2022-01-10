Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711EB489E5E
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jan 2022 18:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238302AbiAJR3D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jan 2022 12:29:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238284AbiAJR3C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jan 2022 12:29:02 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94EC5C06173F;
        Mon, 10 Jan 2022 09:29:02 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id j6-20020a056830240600b00590eab8f4fbso1156570ots.8;
        Mon, 10 Jan 2022 09:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7gfWYRvC8m3v/szxt6rnVGDFWH+WIQ1HB5K0b5pwINM=;
        b=PPbPIV/LeGYUdXkEAmODbYLTtpunWWhlhV4mRxBUZc4DOhsVqf+WkV+Cerlq9W+0PK
         2tpXw89IQRkDtSSkermTUYFj1KV8Hd9G3O5ilhprVGGXvOz72CTuzEuRB6NYD7WBBnKo
         1IiGIcM8oZP2membzetBEazFn1ujtE1wzclac+zz+QAa4g+FEQo2GqCjEI3vSHAq9x4c
         SU3B5eNvY5sBTe/COw2te9GGET52cSBtruU5fBaxrlPB5m//iLgR5G/tP4O2O0FgGCTI
         sjM0y2sWT9+u1d9WSNDh7KC/iabkn1NkfR4aDJX3k2LBec2lpTTD04SDIjDsZvfB1QRg
         LI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=7gfWYRvC8m3v/szxt6rnVGDFWH+WIQ1HB5K0b5pwINM=;
        b=2Ejo+8o9abXZ2/OWJDhVXjYU23ZUOFmfXNrvJO48LVNpIYP7Lnsr58csPmHjfSbzNq
         eUMvFX6lSFEkPanUvQVgc6hvKb9NZNP6x8U6pCuvYvgumh8Z46/BeWM6FKov0ami/KOD
         Iow8H7HI2H3DfloKmiBYddAEdF0BDALQHrhBQIb2ySBM4lSp4RZr21t6sIw41fuQsp0q
         ieo3Ke5KCjsI5dynLzJ91XRhtZS/qB0cyg3waVa7ZSvlOdLqSKXapz3EueqrIsI+MRrb
         MELBXkmeUDmnAFeMl6X+5gCBdlF5cZUHA4RSd1UZhC3ccj1XjEVUrjC4zezRvhjLL8dS
         BGAw==
X-Gm-Message-State: AOAM53251rsfHtkO06m/IpKrCmx3LAhQJfTYV7qaONqcfA5rZoO9uiwC
        b+zVqMjk3Bk/iNmqHL69AiH1nySjkj0=
X-Google-Smtp-Source: ABdhPJwMyf6Ml71veWa0UvqQDnZpN3v/oN9/brCsvv4Js2K3lIt6cboh47xY6ofJywyTJDujTESNwQ==
X-Received: by 2002:a9d:bf7:: with SMTP id 110mr634464oth.94.1641835741910;
        Mon, 10 Jan 2022 09:29:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v7sm1237158oiv.46.2022.01.10.09.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 09:29:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Jean Delvare <khali@linux-fr.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/2] i2c: smbus: Handle stuck alerts
Date:   Mon, 10 Jan 2022 09:28:55 -0800
Message-Id: <20220110172857.2980523-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

While playing with SMBus alert functionality, I noticed the following
messages if alert was active on more than once device.

smbus_alert 3-000c: SMBALERT# from dev 0x0c, flag 0
smbus_alert 3-000c: no driver alert()!

or:

smbus_alert 3-000c: SMBALERT# from dev 0x28, flag 0

This is seen if multiple devices assert alert at the same time and at least
one of them does not or not correctly implement SMBus arbitration.

Once it starts, this message repeats forever at high rate.
Worst case, the problem turn resulted in system crashes after a while.

The following two patches fix the problem for me. The first patch
aborts the endless loop in smbus_alert() if no handler is found
for an alert address. The second patch sends alerts to all devices
with alert handler if that situation is observed.

I split the changes into two patches since I figured that the first patch
might be easier to accept. However, both patches are really needed to
fix the problem for good.

Note that there is one situation which is not addressed by this set of
patches: If the corrupted address points to yet another device with alert
handler on the same bus, the alert handler of that device will be called.
If it is not a source of the alert, we are back to the original problem.
I do not know how to address this case.

----------------------------------------------------------------
Guenter Roeck (2):
      i2c: smbus: Improve handling of stuck alerts
      i2c: smbus: Send alert notifications to all devices if source not found

 drivers/i2c/i2c-smbus.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 6 deletions(-)
