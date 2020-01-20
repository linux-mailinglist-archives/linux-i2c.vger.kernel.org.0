Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 422F81422C7
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2020 06:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgATF1w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jan 2020 00:27:52 -0500
Received: from mail-pg1-f171.google.com ([209.85.215.171]:38543 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgATF1w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jan 2020 00:27:52 -0500
Received: by mail-pg1-f171.google.com with SMTP id a33so14946893pgm.5;
        Sun, 19 Jan 2020 21:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=x42fojAYJQarwF0l5248oCT+sZ1y4ZvDDvJdzwlnTzk=;
        b=jkX5sQ+idw0y+MSZMvIWDVMnItMiYSWVIQ0vJr+bwiTvMlVANP6lwA/46BkfSa0A5m
         +SHTd+KrS4z2mZLyFf2vdHJ6FRJyYHrBU7NL1E9PwBmRWAzKujnbcaBmv2QSJ6LRW1nL
         Xv5RslxdNQCbfI3x/Wgx5AGQGOpig/YXnKNVjk2tSTYXOMPhfrpFIHr87JnnMK/SYkUS
         rJWBx255NObtNOCbDtmduSH6rjj88lMd3hDb5re94rP3haPazDAFR/2Q9qGaVSHmatFE
         PyyjkECHTp2MEqNOW11favTiZUsV4rPlLhQ61Qq9qK00fvusMcefNSIlEO7bLbo4z2OG
         YYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=x42fojAYJQarwF0l5248oCT+sZ1y4ZvDDvJdzwlnTzk=;
        b=ZWsCWW0shlX1+bhKdORbp4nrnVYy9tChyUti0WIbZCY37l3QG9DaOWmLsGBtBBy9rE
         aHL1jzEKnE0ylV4wwzwue6a8IXkhofCXw6qXppAzSopmrRDzcU/NfliNGgbaCK0zhDkr
         KDfGnhfrOud3UCg/TRJeTc+UwF6KyPbYE7Px3gJIu+3FhqzPhgoKMFVNi9GZiJF2wR9z
         Z8zJALSVaeerU1YP3Zk8AudSf7YIQ6jlRdhA8k95yG5P5rhZWZs3PiMZE5xlzelrhTRu
         n481n9+FZMqaj+aaPuyG18GopBkNj4XsY6GLbuZFrMBPFhcGSm9HOMe73C4/YBzLx/mS
         SO6A==
X-Gm-Message-State: APjAAAWp6Mtmgji3oO/SCjKysT65AWBWXPl2XgmYhSzjt20ouYgGrg9B
        Ixj2lmuzFuan5PTRp3uUXDg=
X-Google-Smtp-Source: APXvYqztlxFbDGgPO43lBGJT7gS5Ty9+wE6B8U+uT1Ia8p9s3h/HbtGfmBcIEvsAHiS4WYFv8ZKgAw==
X-Received: by 2002:a62:c583:: with SMTP id j125mr16218405pfg.27.1579498071643;
        Sun, 19 Jan 2020 21:27:51 -0800 (PST)
Received: from localhost.localdomain ([106.51.19.95])
        by smtp.gmail.com with ESMTPSA id e16sm35069395pgk.77.2020.01.19.21.27.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 19 Jan 2020 21:27:51 -0800 (PST)
From:   Rishi Gupta <gupt21@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        wsa+renesas@sang-engineering.com
Cc:     gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishi Gupta <gupt21@gmail.com>
Subject: [PATCH v1 0/1] HID: mcp2221: add usb to i2c-smbus host bridge driver
Date:   Mon, 20 Jan 2020 10:57:37 +0530
Message-Id: <cover.1579497275.git.gupt21@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

MCP2221 is a USB HID to I2C/SMbus host bridge device. This
commit implements i2c and smbus host adapter support. 7-bit
address and i2c multi-message transaction is also supported.

Different transactions have been tested with various common
hardwares, linux driver and user space tools.

Host PC communicates with mcp2221a over usb using raw hid protocol.
Reports are exchanged using interrupt end points. Command and responses
are mcp2221a specific and documented in datasheet:
http://ww1.microchip.com/downloads/en/DeviceDoc/20005565B.pdf

There is only 1 patch in this driver submission.

Rishi Gupta (1):
  HID: mcp2221: add usb to i2c-smbus host bridge driver

 drivers/hid/Kconfig       |  10 +
 drivers/hid/Makefile      |   1 +
 drivers/hid/hid-ids.h     |   1 +
 drivers/hid/hid-mcp2221.c | 773 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-quirks.c  |   3 +
 5 files changed, 788 insertions(+)
 create mode 100644 drivers/hid/hid-mcp2221.c

-- 
2.7.4

