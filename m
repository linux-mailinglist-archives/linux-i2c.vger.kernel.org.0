Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482053D529F
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jul 2021 06:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhGZEL1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jul 2021 00:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhGZEL0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jul 2021 00:11:26 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40142C061757
        for <linux-i2c@vger.kernel.org>; Sun, 25 Jul 2021 21:51:55 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id p5-20020a17090a8685b029015d1a9a6f1aso12081479pjn.1
        for <linux-i2c@vger.kernel.org>; Sun, 25 Jul 2021 21:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mJObmosw0ECxR5bJoxzM8fJ9A3xHxXUklA4Az95YtEw=;
        b=v7SItLgkseAmfU2SuQoWbIGar0knRK0cIjLDi+TJza2wkb62A0wyaMZI4pIbqEpqR3
         9D20yhOV9HG4H1AiGzztWiX33fsODizFsIMj863LwJ2VQpaDz/3V36RIir4OqV6uDX/1
         K44beOOsdsumld4Peg+pzllADsAKuxQ8z89dp9seCs0d9xpu+4YWMUL3FOf0LyibnV5k
         i1yKFLLsCF/sXIYMCeiSBYVczAP22hSukf5bkiroV8p8ksxpkvWN4eXGCusCyEWR5aFW
         4zV6AnUjLYKiGe8cQcsFr21zGL5WCm5JRKMOGXDJgyzoZ4PLuKd+EwGYLHW9psHvNH4C
         wGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mJObmosw0ECxR5bJoxzM8fJ9A3xHxXUklA4Az95YtEw=;
        b=uZH+PmLq8o20bSsHojbggETeSKIAVcnf9bkrFCOs54O/b7K2ZXxlZb5FjGz1eFbDun
         5t5gwjz4scOz/POrUEBS/ZgsbUmMJuOJ4ImVxpfp59/aATB+RPFyZIgmZPsSYhnHsm2X
         WLRgNcvg8iIEVo02Cgf6XgMvCHyTPYTVUHC/QpPgfQcLVJpGa52DCzfKAV5dYYJ5EwWp
         rNoVey/R7C12jyBc1FYpHRG7oQWsIT4BY6kYiyOLx8mbJoYtnfew4POioi/yTmChY4sP
         m693A/k1ebRMwbQHqa00SUNBcXK4VYrJHqa1aWysBN1o5MD6gHY3g/6Ymqlj/fCg8SVc
         3SVg==
X-Gm-Message-State: AOAM533l9Y3N0Dz9g2bXwl7GItpyH8j0lYeXP36EyLpjHzUXcwV2AmMw
        qOdxf/w8WqIGD1YKoyRzBpyb5A==
X-Google-Smtp-Source: ABdhPJy5OKEmuRfMBzlsPuZ2ShGKKwtJXiA4VYNNauDJf2d0UT0A/YpaXVGlAhHSV5jSoKAw4VDIFQ==
X-Received: by 2002:a63:5706:: with SMTP id l6mr16514459pgb.217.1627275114651;
        Sun, 25 Jul 2021 21:51:54 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id v5sm46165190pgi.74.2021.07.25.21.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 21:51:53 -0700 (PDT)
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
Subject: [PATCH V3 0/5] virtio: Add virtio-device bindings
Date:   Mon, 26 Jul 2021 10:21:40 +0530
Message-Id: <cover.1627273794.git.viresh.kumar@linaro.org>
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

Pending:
- Arnd suggested that "virtio,deviceXX" may be a better compatible string, while
  I used "virtio,XX" to match what PCI and USB do currently. I didn't change it
  yet to hear Rob's view on the same before making the change, in case he has
  any preferences.

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

 .../devicetree/bindings/gpio/gpio-virtio.yaml | 60 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-virtio.yaml   | 51 ++++++++++++++++
 .../devicetree/bindings/virtio/mmio.yaml      |  2 +-
 .../bindings/virtio/virtio-device.yaml        | 47 +++++++++++++++
 drivers/virtio/virtio.c                       | 57 +++++++++++++++++-
 include/uapi/linux/virtio_ids.h               | 12 ++++
 6 files changed, 225 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
 create mode 100644 Documentation/devicetree/bindings/virtio/virtio-device.yaml

-- 
2.31.1.272.g89b43f80a514

