Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1422D1E3
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2019 01:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbfE1XCg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 19:02:36 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43917 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727572AbfE1XCf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 May 2019 19:02:35 -0400
Received: by mail-pg1-f196.google.com with SMTP id f25so91716pgv.10
        for <linux-i2c@vger.kernel.org>; Tue, 28 May 2019 16:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=babayev.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OsPnb68aqrZ2ZEL+Z6uQ/zgrptCfKlha02TX65CwO3k=;
        b=ORAXNYMduQ2zCqLfbl+PxYq02uNrg1zkNt12Vxh3KYFmCaONYogJWuwMacCSmBUB3z
         sUTcCbL2dIhxwLIWC8pm3Q1vlYhtC0pc+er+aNxdVUT0xOw1QAwpPv/mZHHGMeIglJmX
         abhnqKEuJEkn7LnH0WEWffxTmLD/g8IBJZPio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OsPnb68aqrZ2ZEL+Z6uQ/zgrptCfKlha02TX65CwO3k=;
        b=Mh2alqqHuEGUvIDi1JelkWSEUfzoa7t30r6j+v61DjpE0M12DvJZtzGnZgxzbqNlgT
         iocT5D9EgGk/SyHeqfXTLKOYlDFI9vnxPmsoJ+DlMUb6u+1efNAUwdUys2dpaojYZbW9
         XIYJGW8Py7f2tqucTnPEpYX/ppVDutkZdyYfzFmrzilMMfJPxePovxHvaKd4h0q+yYQE
         6+boOCtmla2Zdg59guqpqAhnwa8FtYNYFnb95+SVRFbdIDvJL7FgREWoTRjLG5JBmdUW
         FA4RoohyOebmje8LmEfPSwKRT3Ws+OOmZou5nSejY9Pcusth1NVBH9da+FEYmEQCE5Dn
         59Rw==
X-Gm-Message-State: APjAAAWGqc4xNYUi+W0RhgX/z6BwwIVWOO2IrYZomu6u/EUv+cV98pXk
        38QJ/5zbMhE/dLfQXdKrh/n3aZ7WCgoQyw==
X-Google-Smtp-Source: APXvYqwoC/5IrkvcojJ1aNUdOQY1Rohcd2/rY0qY3WWwFrIz2yGjIqSW0v5fwGvlczNGaeU5LXG1cQ==
X-Received: by 2002:a63:1e62:: with SMTP id p34mr49696657pgm.49.1559084554448;
        Tue, 28 May 2019 16:02:34 -0700 (PDT)
Received: from p50.cisco.com ([128.107.241.183])
        by smtp.gmail.com with ESMTPSA id p16sm27028196pfq.153.2019.05.28.16.02.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 16:02:33 -0700 (PDT)
From:   Ruslan Babayev <ruslan@babayev.com>
To:     mika.westerberg@linux.intel.com, wsa@the-dreams.de,
        linux@armlinux.org.uk, andrew@lunn.ch, f.fainelli@gmail.com,
        hkallweit1@gmail.com, davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [net-next,v4 0/2] Enable SFP on ACPI based systems
Date:   Tue, 28 May 2019 16:02:31 -0700
Message-Id: <20190528230233.26772-1-ruslan@babayev.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Changes:
v2:
	- more descriptive commit body
v3:
	- made 'i2c_acpi_find_adapter_by_handle' static inline
v4:
	- don't initialize i2c_adapter to NULL. Instead see below...
	- handle the case of neither DT nor ACPI present as invalid.
	- alphabetical includes.
	- use has_acpi_companion().
	- use the same argument name in i2c_acpi_find_adapter_by_handle()
	  in both stubbed and non-stubbed cases.

Ruslan Babayev (2):
  i2c: acpi: export i2c_acpi_find_adapter_by_handle
  net: phy: sfp: enable i2c-bus detection on ACPI based systems

 drivers/i2c/i2c-core-acpi.c |  3 ++-
 drivers/net/phy/sfp.c       | 35 +++++++++++++++++++++++++++--------
 include/linux/i2c.h         |  6 ++++++
 3 files changed, 35 insertions(+), 9 deletions(-)

-- 
2.19.2

