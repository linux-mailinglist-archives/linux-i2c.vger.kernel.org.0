Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8018CCC90
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Oct 2019 22:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729780AbfJEUB5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Oct 2019 16:01:57 -0400
Received: from mout.gmx.net ([212.227.17.21]:40579 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727980AbfJEUB4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Oct 2019 16:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1570305703;
        bh=Sd6wnYA5peSeUXZgrCIT4VavGWnDDP0WSYqtpfAm27I=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=CPIKC/3tttXa7O+9qL2uEu0knAoH/GnmjSg+Lbl+Z0W4wmjW+v33/ndqIGmaS/0f2
         Bq3OCTvd+qoeHsJI733FaGD2VJPOe6TutR9BqY2RkeXxMcLeqQ7rqtCH0FWnGwvFqT
         /lHj43UYFYxHW2I3SGmW4JLm9I9S4FLNipNhtUgI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fii-1i5bsl2IB6-011ziw; Sat, 05
 Oct 2019 22:01:43 +0200
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
Subject: [PATCH 2/2] docs: w1: Fix SPDX-License-Identifier syntax
Date:   Sat,  5 Oct 2019 22:01:23 +0200
Message-Id: <20191005200126.25809-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191005200126.25809-1-j.neuschaefer@gmx.net>
References: <20191005200126.25809-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vEBOidDYkGWn2b+oD9USOnqO+ERK5jkgjnUkCxTovQgwzcIc+t7
 DE31k2Sw3ChwPqaNTGVv+gVQ+xThXl5FRaC/YV0oAOL1cz/9rtzH8KeHoASul5oodZF+GWE
 fEosmgniJxkpq3Sitha1ffmOs3INl+yN3uaTomPw6OtyZOrKA+kbC0dE5nv5gZGlXjeBqN3
 cNQQxQiH03HpvrBccVm0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rM+MbWlQiRw=:6lE+gzGOxQe4A9jSmb2OE+
 nBLLt4QLCfjQTFQMOcgZh0MAJ1wau5sqsfygogY4cFfdlxUyaioeWjqURB1rt6R+V4HCzpm+3
 gdTS1Rrfzi3e85WmbCY1Tqhhk9n7TArXHsBMizxJAblnzmFL9UGOcJ1/OJCGq9wHc24uSLLMg
 4pMplfYvcs6Xy1GIyrk4RUEwTarOIvU7H+9/tQF5P6tj2/XnFA/GPBk8q55zDNIU8/xsgc91k
 FfGCyjk6v/c1QMKl226uwBxIEVzf4VLxWXhoe53Bgx0vqJWsNL0OjpAFLJw3AIhh9CjlhR7dN
 Ynf52N+HdU7GRrM5Pd/7JajcYKb+dLZJkUfpn//kAsGOLJZ2N+zf41/ClIq6Bsvy6Ljw9dgVk
 SYTPNWhjf9NwrckqTRbiXGs/yKj86tyGZEGgmUPHcJ8N4hXSxoqluPctloqxVUMwl6eswZcU1
 EYoBB63FD9TDTR0SeayJBrD2OVBdKOH4D84COFlv0Ny7xDZELOoJwvrUbKDq2xD9w4RlXW+6S
 takwy2u27M0L8TpLIqomcazeVgwEl+e4rxX5zQ4Igq+NvQkC2PBcC2IyIk+719SFI57mPuuJo
 TNc8OlQhAMW80a6Z2smO+JfMX4EuI55ZR1p3+Tb4jdF8S55sKdunGU3BoECKAoC9Cc9Z+iBKj
 wFzBDVjo2XSpuo7XGYckNc3tex5lDfkKDkRr/PiDrAMXlAdhp+j1LLSgtFhiMVoeGKC4WtN4B
 dJdDeNEAaAbNuK5JrfXXaiiE59DJgD+ci8ynfKg0hjjS3HVTAtgc5sMY4C5K/XPO5dxRGZyXb
 cUQDHLc0FRScg5c2hzNG61XFQvdQ17QaX66CeUu9NGOwUuMC1UMu/u4FQkIFdpxFwKHQBcy3z
 lK+q3E+Kx+6Gp+HVL4Mfv7CYIqQI4V+MwVom09yARTuN8zup9uaIdZy422XWTlL9HRvJl4WXW
 XtG/MrPMk3RJq5JRBwiZmybDu2hr8YF3vdgUXI6nfPvvXi7jO7csnPJNppVo2v6zWlQ3NdBpR
 v0geNRehq5jUI3lg00dLjaYXF0/AjvliMJKrzOYrIun34aVifqdRP6N5QJIKPNOSMN6mMDUpB
 U9hr/ZrOV7P4zWOJ+futIZ1GaJluHrfinwBHOiER+aa26eB1v49Ogj4LbeyyeHc8sEixk/VaF
 LOriwILfHeFCGcXhuXzRMoEI6TCU3pJyh5Ijw//f2LFL6u5+HYL2LV0tzFLUkyRxLCQ8t+IRv
 3Y17z6PKOhJT9UFLkqLxOL8eYlCKTqaxYx1RbsqbrTCsNa83MUHvjcKzt7Oc=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ReST directives are introduced with two dots.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 Documentation/w1/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/w1/index.rst b/Documentation/w1/index.rst
index 57cba81865e2..156279f17553 100644
=2D-- a/Documentation/w1/index.rst
+++ b/Documentation/w1/index.rst
@@ -1,4 +1,4 @@
-. SPDX-License-Identifier: GPL-2.0
+.. SPDX-License-Identifier: GPL-2.0

 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 1-Wire Subsystem
=2D-
2.20.1

