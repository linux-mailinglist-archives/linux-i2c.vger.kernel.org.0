Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2859DCCC8E
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Oct 2019 22:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbfJEUBx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Oct 2019 16:01:53 -0400
Received: from mout.gmx.net ([212.227.17.22]:60179 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727980AbfJEUBx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Oct 2019 16:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1570305695;
        bh=qySV3tlxF55Vn/7Dh9FTVARSYZ+YXZdXkb4UesYQYM4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=BeIKYf+Rmt42RrNTCWaDviRy+ohnDWmmwtQvBURXjRsr2jSBIR1+L+2qplAsJLDTX
         j1QwiTcRdPJJiX0VdWTEETn54MPWxTnykLV6xEIcksLtDRSZuQRi7VRrx9SNEudkol
         cqbSl5ELylxm2zwnF1lGFjkwMLcsszF4ft98YGiY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzfG-1ihgXF1jiE-00R41C; Sat, 05
 Oct 2019 22:01:35 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-doc@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] docs: i2c: Fix SPDX-License-Identifier syntax
Date:   Sat,  5 Oct 2019 22:01:22 +0200
Message-Id: <20191005200126.25809-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LMni/TfrfxOuDts2qQNrNG0VhnaXFqUh0VdHKqWXcHWkUxD9WdJ
 aydOUR7RKdhdSuUNuyJKaLVd3VDkRDRriT57B3ES+TP8te+ViVTdNEIinxeyvOshsp/Ves0
 diYtv9sOgEzKwXnRfNJ+TTID9RsBV4laTAA3wnthUtO3/rJRp/txF0tmAPnOfJsZN/o0td6
 EHWAYdcz9MuHG1peO7Y2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+s/KPiena6U=:C8xDlyRYB+fOBmIf0rMIST
 p+D472UZ9kalsKpLibPkhl/Ta5qkfibzHgDZA/ulZvnH2hZOvD4G3vR7qdPCxlE18L3eLGqGl
 4+dBCVEqt/kR+/JdCdILTA05Q1k7mgRbflfpOJRovtxKUO1dSzPmXmXV+chPCkLhnDKlCoO4p
 OEtsVH9201GgFe+gdRm+1/+RPpC9XhHEXxLecrxyeFkglwTm+uw5jyapkn4ojhmUKzzMkN/vm
 2eGjCF7bbE63bdrZRXNw95EXm/VnEYp5Uqa5NlpfXtzOkhgrq5+XaGhpqgumMBpqcMQO73vrF
 ++WNdtTTBdhRkoeevePY5eIjAsgODcnbL8vgnbPKhGrX+8lbggN8GApVRdcKa+vrig4T6MDAc
 fh8jotdqlJQBm5bY1KLnz21lXg1mWM24Lf4NE8mMiz1hgabhdnsu8QHTRkeBOUDtIBzI6TcsB
 xEF6BPY1PT8LcW6spQCZJJ65klzajkwOOWCweZx3uxw/EkNPydjDVdabilCB75bG/sn8wHpzo
 sRW+xat21OpTRPuliF/LVuY26K2rPSpvFtjjZLjw04besVhU8P66GgBQRxGALQOFXrGdELcSb
 XZQBEy2aU6k7RKav2z28pcY91fRF87MbX3d1Qu1+ecdGQCEA+YBxldM0eX+Z6yLO0mdAYX20j
 WCbWsY0Mo9qdqdMz5vvLONhEQz6uWiNc52SnD/dCNJDMG8DcXpMfHVnJDTENHZfbkoDZW+7NG
 ahdP+sraNm8oeALOOGX6+qzjHATndEf5XxjAX92/3Cej76eKmOuwwNbttwOcx1IaY1bBRE7wU
 PQV9cJ/cnEILkTinU3RTQTiqrnG0RS8Vu3bGEiNyqy3U4PRZw03NW8YDYlYdjsWr6L335Ya6i
 XKJYNFKGgZ4V4xW3o1OY+yrRZumG0zcQ73oRXEaTvmSHqTcYHvvO3XWCX39ZSyAqkl90byfkN
 zCniWWRto3iGtTAsAL3zKSBfgNwjolWQ+otqceo5mGAK3amWiqc6vZM1N0oOOFYyn24jxo9ya
 Y0AbQ8JevR+FX5SMqjPhjX4mnC1L0VLxJbmGmU+nCOSSqNND08lfoN8WeC4WU3+2clyNQXKgT
 IRkC98zwixwLobFzdi3zvhYg6o0Nu3nQ/zsY4y02IAk9WY/hDEmNU62vJRkQQY/x/NXciQDJb
 dvXvHSQJUj38Hyytw1VcJLTAMt+YQ0utJAjI61RB1P0Sg83k+D2+HiJ/1gATWzPg9q51OFP02
 +VwpMpwSpY9MtisDf8AyZ29osmVq9fIdkowWnoHb9/vVlVa5UvJtSvefW+rk=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ReST directives are introduced with two dots.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 Documentation/i2c/busses/index.rst | 2 +-
 Documentation/i2c/index.rst        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/i2c/busses/index.rst b/Documentation/i2c/busses=
/index.rst
index 97ca4d510816..2a26e251a335 100644
=2D-- a/Documentation/i2c/busses/index.rst
+++ b/Documentation/i2c/busses/index.rst
@@ -1,4 +1,4 @@
-. SPDX-License-Identifier: GPL-2.0
+.. SPDX-License-Identifier: GPL-2.0

 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 I2C Bus Drivers
diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
index cd8d020f7ac5..a0fbaf6d0675 100644
=2D-- a/Documentation/i2c/index.rst
+++ b/Documentation/i2c/index.rst
@@ -1,4 +1,4 @@
-. SPDX-License-Identifier: GPL-2.0
+.. SPDX-License-Identifier: GPL-2.0

 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 I2C/SMBus Subsystem
=2D-
2.20.1

