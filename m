Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406A220DFD8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jun 2020 23:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733035AbgF2UkO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 16:40:14 -0400
Received: from www.zeus03.de ([194.117.254.33]:52750 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731720AbgF2UkH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Jun 2020 16:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=FpyLO74xYjwKVoBrUpqtoejScYA
        bwTvzYbQXG0AzIBU=; b=nQ1EUsahMFmEkwYyu5L8gzzK0xSmXQHQpDVLCkDqXoO
        v4t/EgmTCxUIckP1tzbNOvdWoLmZznuQMu95FjgmVhplDTnP3JFypGn0hzCODzfR
        c9INa5KqnlKywhP4lfOt2gtgpaYnsQxoCeoKdnuOdv65OwtYHSU3mCqB2zUpeh/M
        =
Received: (qmail 2142400 invoked from network); 29 Jun 2020 20:53:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2020 20:53:24 +0200
X-UD-Smtp-Session: l3s3148p1@sQ7Okj2pYLQgAwDPXwOPAD5GWjq5uCZs
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Alain Volmat <alain.volmat@st.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFC 0/1] i2c: add slave testunit driver
Date:   Mon, 29 Jun 2020 20:53:17 +0200
Message-Id: <20200629185318.23381-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Motivated by a series by Alain Volmat which implements SMBus Host Notify
support as a slave backend[1], I wondered how I could actually test it.
Then, I picked up my old idea of a "custom remote device" and
implemented it as another slave backend. This is the first draft and it
works quite well on my Renesas Lager board where I connected two I2C
busses where both I2C controllers are master and slave. One slave is the
testunit, one slave is the HostNotify listener.

While I really like Alain's approach, there is still some more testing
needed. So, I already release my testing environment, maybe other people
are interested, too. This patch depends on a documentation update. Also,
for Renesas R-Car SoCs, some fixes are needed. I suggest you simply pull
this branch here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/slave-testunit

As mentioned elsewhere, support for SMBus Alert and I2C_M_RECV_LEN are
already planned. But I guess you can do much more.

Ideas and comments welcome!

Happy hacking,

   Wolfram

[1] http://patchwork.ozlabs.org/project/linux-i2c/list/?series=185718&state=*

Wolfram Sang (1):
  i2c: add slave testunit driver

 Documentation/i2c/slave-testunit-backend.rst |  48 ++++++
 drivers/i2c/Kconfig                          |   8 +
 drivers/i2c/Makefile                         |   1 +
 drivers/i2c/i2c-slave-testunit.c             | 146 +++++++++++++++++++
 4 files changed, 203 insertions(+)
 create mode 100644 Documentation/i2c/slave-testunit-backend.rst
 create mode 100644 drivers/i2c/i2c-slave-testunit.c

-- 
2.20.1

