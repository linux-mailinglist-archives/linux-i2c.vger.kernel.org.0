Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1D5A3D6DF3
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jul 2021 07:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235174AbhG0FX7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jul 2021 01:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234930AbhG0FX6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jul 2021 01:23:58 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394A8C061757
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jul 2021 22:23:58 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d1so7206706pll.1
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jul 2021 22:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m4PnQ7w4ZXIbpbMOd9mPAvOkoi0Otfkeze5HMzWqDSM=;
        b=o00HtKxdOf6pgzaZcv7v0RCIAoZcftZntng7XdmVuSjqtZ2b8wjG0kSMM7lu+GX68P
         2rGAKWvz/uQTh7cL6jW438A+V9TeI9mbi7wXXpHEaCUsQO3V1v4i0tPJOb0ngMv0Bs+3
         M9LJQEIBANelTQ65JuIiInXty805GkKN7ycj23u1RGZ6a/GCtZlF8xOOaDiuOcC7b8mI
         iengHNowfdX5rLoqaQAOYI41O5sesvJCvfaY/KTyhE0bpWP0nsq021X7Jjh657Cqg/eO
         0GRu4vqdaCm4aOorJ9S1mFCYSrxF5VM0sNpLMnvGF5x3CVa7NcLr3JdNlz1zonTq6BAo
         paYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m4PnQ7w4ZXIbpbMOd9mPAvOkoi0Otfkeze5HMzWqDSM=;
        b=CC8UMoq5bTTS9fa2RXIDplkfBPp+rKqzcT7L0zw0PveAnQvfrkYg09Y4KSt2AlyOSi
         Mzo5J+AO4Mz2ud1k3xezGFZ/vnj5oXcxPE6SyByyPq8xojffkvyjj4ClSodJzRi2nFeH
         1uJpPNFK/5dE6XuOzjZbGm0ZtkkSJGpA7pev33dfD0EKBSQ4N3bwe+IAFkSW99oKD4DQ
         wC5sZ4AFZE6afxLwRmRmoNOTtjlc7EhjVbEmfLIsf1i1dJxEJLe1zrPBeZsxbYrVhtCe
         5CdbAcsEKxUEvC4G64k84VMQ9VsRutdpuCiBW/X3CtLZsuGosL6u1GCsGvls2fYb28oC
         Lgfg==
X-Gm-Message-State: AOAM531WIZM2YJ+71uxAeuy1jbpQEtspczWsH8kTvDNuKvnqgJ1P4l3e
        gX+JcAOS+7uW0VTNVtYrlOXEpQ==
X-Google-Smtp-Source: ABdhPJy/IRVuyZuRXHBDpEnTOVpnPmvmUefMG1xV1ZaD3TQ9HJ4t8TjZaCD2LotwfkdOo+epC0N74Q==
X-Received: by 2002:a17:90b:1d84:: with SMTP id pf4mr20491531pjb.166.1627363437795;
        Mon, 26 Jul 2021 22:23:57 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id f18sm1903790pfe.25.2021.07.26.22.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 22:23:57 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH V4 0/5] virtio: Add virtio-device bindings
Date:   Tue, 27 Jul 2021 10:53:47 +0530
Message-Id: <cover.1627362340.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Currently the DT only provides support for following node types for virtio-mmio
nodes:

        virtio_mmio@a000000 {
                dma-coherent;
                interrupts = <0x00 0x10 0x01>;
                reg = <0x00 0xa000000 0x00 0x200>;
                compatible = "virtio,mmio";
        };

Here, each virtio-mmio corresponds to a virtio-device. But there is no way for
other users in the DT to show their dependency on virtio devices.

This patchset provides that support.

The first patch adds virtio-device bindings to allow for device sub-nodes to be
present and the second patch updates the virtio core to update the of_node.

Other patches add bindings for i2c and gpio devices.

Tested on x86 with qemu for arm64.

V3->V4:
- The binding is named "virtio,deviceXXXXXXXX" now.
- The virtio binding doesn't restrict the node names anymore.
- The i2c/gpio nodes are named i2c and gpio now.
- Dropped including gpio.yaml.
- Updated code to match the new binding name.
- Use "type: object" in additional-property.

V2/2.1->V3:
- Added review-tags from Arnd and Wolfram.
- Only the 5th patch changed otherwise:
  - Use of_device_is_compatible() instead of keeping a list of devices.
  - Use snprintf (with BUG_ON on return value) to create the compatible string,
    whose length is fixed using "virtio,XXXXXXXX".
  - Use dev_of_node().

V1->V2:
- The changes (both binding and code) are made at virtio level, instead of
  virtio-mmio. This allows the same to be used by all device types, irrespective
  of the transport mechanism.

- Dropped the reg property and used compatible in the form "virtio,<DID>".

- Dropped dt-bindings/virtio/virtio_ids.h.

- Add a patch to sync virtio-ids from spec, required for the last patch.

--
Viresh

Viresh Kumar (5):
  dt-bindings: virtio: Add binding for virtio devices
  dt-bindings: i2c: Add bindings for i2c-virtio
  dt-bindings: gpio: Add bindings for gpio-virtio
  uapi: virtio_ids: Sync ids with specification
  virtio: Bind virtio device to device-tree node

 .../devicetree/bindings/gpio/gpio-virtio.yaml | 59 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-virtio.yaml   | 51 ++++++++++++++++
 .../devicetree/bindings/virtio/mmio.yaml      |  3 +-
 .../bindings/virtio/virtio-device.yaml        | 41 +++++++++++++
 drivers/virtio/virtio.c                       | 57 +++++++++++++++++-
 include/uapi/linux/virtio_ids.h               | 12 ++++
 6 files changed, 219 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
 create mode 100644 Documentation/devicetree/bindings/virtio/virtio-device.yaml

-- 
2.31.1.272.g89b43f80a514

