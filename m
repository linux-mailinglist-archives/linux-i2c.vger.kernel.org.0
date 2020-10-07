Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73EE0285A18
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Oct 2020 10:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbgJGIIN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Oct 2020 04:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgJGIIL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Oct 2020 04:08:11 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCC2C061755
        for <linux-i2c@vger.kernel.org>; Wed,  7 Oct 2020 01:08:09 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id t21so1195285eds.6
        for <linux-i2c@vger.kernel.org>; Wed, 07 Oct 2020 01:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bGSaUBpUa7h3fJNtYObjMDqGR9Ro46H8/LDVOVOxdpA=;
        b=bSN8spIR9xUdSRkZ32gyacqTUcBVqvjgg+fTC1ekYl0AokfdWqIn8LFypvOYpbo38i
         cMTvixuZ/BStwWXTskgekW/5ucWRgKrX86vmjkGne7IqqShgah/SJRgB+CVrmTDvTfpz
         MnN4Jbgs9uvd6rnOErAqgY6cu/xXcld8dzrEubFtqqzlJ4SYJ6pOs9sTKrDCET55sgGF
         driJcWaouxN8vLSnxF4T0p5EUExeyhnVmGI+JH5D1OJ0zqECV+7uv20hREo2JVEuDclB
         ubVry93jRm7PVxX4vVmtawhppul8FdyFe1TOQXm928FO1UK1Rfo5fafKxZ4omdilI00I
         5CaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bGSaUBpUa7h3fJNtYObjMDqGR9Ro46H8/LDVOVOxdpA=;
        b=HPFLmtn/+cCvaim1EQtJn33stgEga/7wnGaZcIZc7wfE83OUkts6NMFbth4iWt4TwJ
         Z6qAGnJK1PPIlnbfFzF6Se4N3NswURWo+EWVbkBwPUynAB83xhGtt7L31Mh+c8ejxoar
         wj0dlMh06a7U6MqmZQsThXIt01AT6+17QR86IeUnV9pxPQd8XGTeZqGEX/7e1lEGS2GR
         gmsK7atu40PwQfV1PhZFXbUuWYewzqLhrrsH7dZty9si8w4jQPCI4+bq70X72MiWZ4HQ
         0os9TKHbE7Zox74pT6CdH7eqnwBQXH5wtm7ElJUV1TocFmbnD0DlhkRHoKmSsb++idQt
         CGBA==
X-Gm-Message-State: AOAM533oOcaOadQdxG1W1cUM2BQGXW0BB6a+Q4trh8FeO/h/6VQEgQjQ
        mxsivOxseI0sYB6+4L5zvIDbHebGdbrnNA==
X-Google-Smtp-Source: ABdhPJwq4DM7Wcl63R3341ewtPx1CDtsyrwGljNdz6qXSDJ5K2AqSjcd8k6iCCwk/nBKKBLAmDFYLQ==
X-Received: by 2002:aa7:cb05:: with SMTP id s5mr2224828edt.363.1602058088071;
        Wed, 07 Oct 2020 01:08:08 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id p11sm888645edu.93.2020.10.07.01.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 01:08:07 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Wolfram Sang <wsa@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Nicolas Belin <nbelin@baylibre.com>, linux-i2c@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] i2c: meson: scl rate fixups
Date:   Wed,  7 Oct 2020 10:07:48 +0200
Message-Id: <20201007080751.1259442-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patchset fixes various issues related to SCL rate on AML SoCs.
We retain the method which was used so far to set the SCL rate.
This method does not provide manual control of the clock duty cycle
but so far it does seems to be a problem for anyone.

Amlogic vendor kernel source uses "HIGH/LOW" method which allows to set
the rate and the duty cycle of the clock. However the documentation
around this method could be better and the result on actual HW is not
perfectly aligned with the comments in AML code. In case the current
method ever becomes a problem, we might consider switching to this
HIGH/LOW method.

Jerome Brunet (2):
  i2c: meson: fix clock setting overwrite
  i2c: meson: keep peripheral clock enabled

Nicolas Belin (1):
  i2c: meson: fixup rate calculation with filter delay

 drivers/i2c/busses/i2c-meson.c | 52 +++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 19 deletions(-)

-- 
2.25.4

