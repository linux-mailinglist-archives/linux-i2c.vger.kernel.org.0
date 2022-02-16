Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 706E64B8201
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Feb 2022 08:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbiBPHrD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Feb 2022 02:47:03 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:47590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbiBPHrC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Feb 2022 02:47:02 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E2E22BF2
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 23:46:49 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id f17so2460895edd.2
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 23:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z9nt70mNjga/PSpxElizqUxSJsKrZQkqqk3JOgxpH+g=;
        b=ZWixcys+zyjSIq1+vDsIAFoXAQXtnAVPOJkKWRHO4VZEAh023KWueyKV1p1tYLAAcA
         PTUd67gvs9EtfI5pOj7CJ5RfEVHwtNTY8l6kJMh7VNaLi/IfmSGO9KCCUXLbK8OdE8V6
         5wc/xYx3QSJ6cSSw8m3DtkpPwqzfFJEqAe1Ft7/eFRRPLKHCXdBAnsnI+CGGrIa/vU7P
         8Z6Np3GUkWK8/QpF1gT665wm1ve8V1KuSsDGJwHp4jXGvonvaHgO+BLJjeIvYvQjE/Cs
         jS25w2bujDROd8Rf4PyfaNj3s1a7tvCDx74LfIlj/0i4aWsAgouZGyUiKJRJIBVCSovZ
         /KMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z9nt70mNjga/PSpxElizqUxSJsKrZQkqqk3JOgxpH+g=;
        b=NIyOLlFVBwFFA31lUgBcC2FeyvEX+Dv/s0VDzlW+5khd4hKfhfEo98aBkFnNvYl6Tl
         Zu3oDB6jUqH37oswS+qNdjwAgjgFh6CTt7wcheEiw8kaialUwLyZdlboXCc98yLVndGF
         Plbve+wYXqMa4yzP3Q5qQBhgpfXna4CDHsKGztzKKeyZeERQiryoKYzTSQwMMr+JGzFL
         WIVg8XVkIcDdCDBbEP+/bLMD6BPHWYaGs/RQiz6oiK9M3+0QZK5Hbm8TgpAerz3T3JSD
         B26PshxuIvTaweuNxWlfsHNkpL6m2zgImVrL/E4sPkTymjdGMMzrubyDmZBycqPe/mqm
         HR/w==
X-Gm-Message-State: AOAM530XgFisTpkrDw5atucDEH9lp3zOxvsuL3LDjEiAmKMUS992/0FR
        wtW/4RZm2qGl1ldbKxYmA66MyQ==
X-Google-Smtp-Source: ABdhPJwPAqmNeD8fX6SrwJ0It07c6erWWjbq18zDEEyiHb7ljjBrVvPEHd4smT+PMHvDND4tqukPsg==
X-Received: by 2002:a05:6402:7cb:b0:410:dde2:5992 with SMTP id u11-20020a05640207cb00b00410dde25992mr1614297edy.323.1644997607647;
        Tue, 15 Feb 2022 23:46:47 -0800 (PST)
Received: from fedora.sec.9e.network (ip-088-153-139-166.um27.pools.vodafone-ip.de. [88.153.139.166])
        by smtp.gmail.com with ESMTPSA id gq1sm11615202ejb.58.2022.02.15.23.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 23:46:47 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v6 0/3] Add support for Maxim MAX735x/MAX736x variants
Date:   Wed, 16 Feb 2022 08:46:09 +0100
Message-Id: <20220216074613.235725-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v6:
- Fix typo in dt-bindings

v5:
- Remove optional and make vdd-supply mandatory

v4:
- Add missing maxitems dt-bindings property

v3:
- Merge dt-bindings into i2c-mux-pca954x.yaml

v2:
- Move dt-bindings to separate file
- Added support for MAX736x as they are very similar
- Fixed an issue found by kernel test robot
- Dropped max735x property and custom IRQ check
- Added MAX7357 config register defines instead of magic values
- Renamed vcc-supply to vdd-supply

Patrick Rudolph (3):
  dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
  i2c: muxes: pca954x: Add MAX735x/MAX736x support
  i2c: muxes: pca954x: Add regulator support

 .../bindings/i2c/i2c-mux-pca954x.yaml         |  44 ++++--
 drivers/i2c/muxes/Kconfig                     |   4 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c           | 126 ++++++++++++++++--
 3 files changed, 153 insertions(+), 21 deletions(-)

-- 
2.34.1

