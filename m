Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBCA18C110
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 21:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbgCSUMh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 16:12:37 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34416 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgCSUMh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Mar 2020 16:12:37 -0400
Received: by mail-lf1-f68.google.com with SMTP id i1so2020437lfo.1;
        Thu, 19 Mar 2020 13:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7auRkkaZYMMzWg0GGIYKar0A2d3mOqgB5Mc6nhNM3xs=;
        b=M6RZIvWbXnQCK5Mh2BTTcfuSWh8RxYfhE4K2ty34ZDykLwZhGSAKiSBJ0Kl5Rein3u
         yQsGwibDYOvWWn68YXv1NAXmELcohDFeLmwdNFVS+FT4sDPKokSB5Q8mw+tpcJFC0Xcu
         etZP1xJexXellcTA2Ha8oHxgNt9pSGPuMJxBqUjgtSQ4d6dKuIzpxNWajSocel6JT4lm
         NP2Ac2OvSqGxvyEtbSGJDqN3OG6WfroYc17LsqKduFGO5UjsmH/HwX9DopNYPgpdB3j1
         pC9dlG5qQjnn+EftdtzbEHONebRDVRzCWRXathBXCu0TT8Bznsrw68L3JnP3yOyIkBG0
         wMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7auRkkaZYMMzWg0GGIYKar0A2d3mOqgB5Mc6nhNM3xs=;
        b=cxEJOKiYUTPvVKV/sqitGKgtXZVm5ioL8aooMgZOoPDFHAogJtFmFOcCkeheYzJgEl
         tnQSvtOCmofumfb+T7qOUog8x0ZUv0wf/JaMtAM7pzo/oys88lZkVITJb+MHUAiGsBwQ
         OSGje4TqOpywRot00bU1FLf87tN33LcwQI59s87oAA6Bdpn0u+0tmdziG/r5g0Rjl4SP
         5niH8pj/vlf+TL9an1AkxNX4C18wQo5mpM5FG1pz9vxE1AeBF/+HopAKfmUp9GVL4hyj
         EGSarOqNKOAuBv0K8WIIeROvMYsGbfbwhAHDnEmYd6EgPAnPjt6I1WijRgSf2llRBja8
         VKqA==
X-Gm-Message-State: ANhLgQ2ApcWj4md6GKcDQRTH4VTKjrNO/tSZ1G6ujaGk3zEAZkTBqEPs
        EZ8swKMeig3XbvEwMS+flko=
X-Google-Smtp-Source: ADFU+vtUpVX9hHMM3jbWlFUsrqbFN08htYRQES7lbg0LO4tEzEKU4X6IO1NELO/4IaREk+Tne5Ix/w==
X-Received: by 2002:a05:6512:31d3:: with SMTP id j19mr3157200lfe.178.1584648755385;
        Thu, 19 Mar 2020 13:12:35 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id z21sm2059317ljz.49.2020.03.19.13.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 13:12:34 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] NVIDIA Tegra I2C synchronization correction
Date:   Thu, 19 Mar 2020 23:11:38 +0300
Message-Id: <20200319201140.17451-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

Recently I found a way to reliably reproduce I2C timeouts that happen due
to improper synchronizations made by the I2C driver. It's quite easy to
reproduce the problem when memory is running on a lower freq + there is
some memory activity + CPU could get busy for a significant time. This
is the case when KASAN is enabled and CPU is busy while accessing FS via
NFS. This small series addresses the found problems.

Please note that the "Synchronize DMA before termination" patch implicitly
depends on the "dmaengine: tegra-apb: Improve DMA synchronization" patch,
which is sent separately, otherwise DMA synchronization won't happen.

Dmitry Osipenko (2):
  i2c: tegra: Better handle case where CPU0 is busy for a long time
  i2c: tegra: Synchronize DMA before termination

 drivers/i2c/busses/i2c-tegra.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

-- 
2.25.1

