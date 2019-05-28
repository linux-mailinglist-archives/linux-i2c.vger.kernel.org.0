Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 814192BD9E
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 05:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbfE1DWP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 23:22:15 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33155 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbfE1DWP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 May 2019 23:22:15 -0400
Received: by mail-pl1-f193.google.com with SMTP id g21so7733388plq.0
        for <linux-i2c@vger.kernel.org>; Mon, 27 May 2019 20:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=babayev.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=txkPYx4kl/dbr2peXVzI1JFIF8M0v7UB6YuZExmYRSc=;
        b=RPgmgTE070YVO9U/nSaukvceq0z2LI7bXy7zOuS7TU8p0LInnNih5j7BECvhrURzaA
         mxTWhkNYa0Z3IJYe8lRswb0XVbKZ1NPbn9sPGi4X3Xyox5YK5GvS7Co/yvOtqoxfx/4h
         k+xL8PEz2ZonoAumksNuC7eI6sg2A3y13B01I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=txkPYx4kl/dbr2peXVzI1JFIF8M0v7UB6YuZExmYRSc=;
        b=np2a46SSRoIuEKQ7WSkjS8VYB1Ih2T9j84bS7so8fPrX4DXMtlHdZUJp2C8o4nSyAP
         UtocTcHzr+zmzvQ4DuULFiB22Q5JIK3esHrXOLG9df9YGWQuyeu5QQjqFnjvCk3H69md
         heNl2f/uXe1Xh3NcFyJCwC4jOYPQi6SZ/vfJWyhcy+vw2DI7ZnVjU7N3lWemfJDwoWJp
         dAqXJgRsc4mr5LOo6Pyf2m1wqJh9n0i9TS41Djfi9XY6J5LOUiKNI4eSaCjSUIV4XM2R
         xibHpq+reRgsjF5Rz0Oo3ezvnnHGasP1W5ajSh3vyVHYZDNCMTEgAJqElh38LkUCC0TF
         Px5g==
X-Gm-Message-State: APjAAAVHXjKTHUbzMk0Loug4jzFn5MI3GPcMLkbehVeNFUF/VG828RbH
        5NQ8Yw5pYGTBLeA+gPyVTvxa4w==
X-Google-Smtp-Source: APXvYqxZ6q0wb4tst0o7iW9zQi1zpzrRqJ4aOJnY2Q1Qy1NYBL2UVXh9DmnyYdL6fagHbkPJ7Ew49w==
X-Received: by 2002:a17:902:121:: with SMTP id 30mr2837278plb.314.1559013734376;
        Mon, 27 May 2019 20:22:14 -0700 (PDT)
Received: from p50.cisco.com ([128.107.241.177])
        by smtp.gmail.com with ESMTPSA id h71sm933042pje.11.2019.05.27.20.22.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 20:22:13 -0700 (PDT)
From:   Ruslan Babayev <ruslan@babayev.com>
To:     mika.westerberg@linux.intel.com, wsa@the-dreams.de,
        linux@armlinux.org.uk, andrew@lunn.ch, f.fainelli@gmail.com,
        hkallweit1@gmail.com, davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [net-next,v3 0/2] Enable SFP on ACPI based systems
Date:   Mon, 27 May 2019 20:22:11 -0700
Message-Id: <20190528032213.19839-1-ruslan@babayev.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Changes:
v2: more descriptive commit body
v3: made 'i2c_acpi_find_adapter_by_handle' static inline

Ruslan Babayev (2):
  i2c: acpi: export i2c_acpi_find_adapter_by_handle
  net: phy: sfp: enable i2c-bus detection on ACPI based systems

 drivers/i2c/i2c-core-acpi.c |  3 ++-
 drivers/net/phy/sfp.c       | 33 +++++++++++++++++++++++++--------
 include/linux/i2c.h         |  6 ++++++
 3 files changed, 33 insertions(+), 9 deletions(-)

-- 
2.19.2

