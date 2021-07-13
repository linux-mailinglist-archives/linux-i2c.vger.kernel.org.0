Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1393C6EE8
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 12:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235552AbhGMKxi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 06:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235484AbhGMKxh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jul 2021 06:53:37 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CED4C0613E9
        for <linux-i2c@vger.kernel.org>; Tue, 13 Jul 2021 03:50:47 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id a14so10898684pls.4
        for <linux-i2c@vger.kernel.org>; Tue, 13 Jul 2021 03:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4xLUJ1dW1Qt0KgF3pEuea/62PVc6DCT7EsaU/Szp0Bg=;
        b=E2vCdTP4Dqtla5LUcohrAy+3w9yg8TqQrenrE5K9FTm+s6OAAqAP4MkvIUanmoewVh
         p9Xoha8+yUnUYTMCuoC0YpI5U+SKq2/0jW9vqhW6ACR2JbmbQlA9mE3k0V9hJ0hd8oan
         tTlxN5pFfvjiYWIdZqviVCBXIrYVnUuADNxLHBtHQAw7pqzSDE/xUbphfgNvfjOHqS5u
         JeJ0nuh0WIXCgIrUZzo3opYAS5jkLPFYAnwd+nwZ+eSIYIbqkkdOPQeqgg2Mc7wm6yd8
         LE1lVaUisP/flFiy87qUDrIeegoszDgg1BVBZsTYuXAIoMCvvY120W27WX3hWkBNqpEq
         uoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4xLUJ1dW1Qt0KgF3pEuea/62PVc6DCT7EsaU/Szp0Bg=;
        b=r3593Gx8I6HTJVi3GhGESoMXCkt5FHva8V8lvtX4YOT5HaPd1jwzrjWinuKHlsGx4A
         SepQyBQ41BSJ1ioFp9O3YfHJ/Ico0mO7tEWN/TXO1ejRrs/dq1hAthbMlSAjdxxFzn02
         aisNPs/nwJYyo60yWVlSZLqTfSpU3wUPN9YRQoK3Ct0oLAGQfKs6dUynUNMGmt/j2BLT
         Z2h1LSPK2LZlYJt4Ea4aMrZ/mma7dwK/lKIY1IMIPbafGBo0Bi43YbzAT1K4zsZyGlcB
         pILUs5Uo4sKX52JTCzt0gx97tSIQRshXS/Ot1p01r5jvnDaWxKHGQLhTqoVBePBzotj0
         qSEQ==
X-Gm-Message-State: AOAM533X1X8B1W8k/mhKRBLgywI/kDO9OeOYbn96L/AkmdzRXJzcLIjE
        e3Yihwa+PjfpuZZ9YFmqFd9eeA==
X-Google-Smtp-Source: ABdhPJxwSt+fW6q6oLmsbQWUpPWMZxVQMEC0vEz1IMyhrgYVT2WsxbkoAvR6ROOjdRLOSHodWNX0Yg==
X-Received: by 2002:a17:90b:957:: with SMTP id dw23mr12591539pjb.123.1626173446842;
        Tue, 13 Jul 2021 03:50:46 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id lj13sm15276916pjb.53.2021.07.13.03.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 03:50:46 -0700 (PDT)
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
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 0/5] virtio: Parse virtio-device nodes from DT
Date:   Tue, 13 Jul 2021 16:20:29 +0530
Message-Id: <cover.1626173013.git.viresh.kumar@linaro.org>
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

And each virtio-mmio corresponds to a virtio-device. But there is no way for
other users in the DT to show their dependency on virtio devices.

This patchset provides that support.

The first patch update virtio,mmio bindings to allow for device subnodes to be
present and the second patch updates the virtio-mmio driver to update the
of_node.

Other patches add bindings for i2c and gpio virtio devices (they have some
dependencies, mentioned in the patches).

Tested on x86 with qemu for arm64.

--
Viresh

Viresh Kumar (5):
  dt-bindings: virtio: mmio: Add support for device subnode
  virtio_mmio: Bind virtio device to device-tree node
  dt-bindings: i2c: Add bindings for i2c-virtio
  i2c: virtio: Update i2c-adapter's of_node
  dt-bindings: gpio: Add bindings for gpio-virtio

 .../devicetree/bindings/gpio/gpio-virtio.yaml | 67 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-virtio.yaml   | 59 ++++++++++++++++
 .../devicetree/bindings/virtio/mmio.yaml      | 41 ++++++++++++
 drivers/i2c/busses/i2c-virtio.c               |  1 +
 drivers/virtio/virtio_mmio.c                  | 44 ++++++++++++
 include/dt-bindings/virtio/virtio_ids.h       |  1 +
 6 files changed, 213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
 create mode 120000 include/dt-bindings/virtio/virtio_ids.h

-- 
2.31.1.272.g89b43f80a514

