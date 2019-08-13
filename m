Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAAC08BE29
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 18:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfHMQVS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 12:21:18 -0400
Received: from mout.gmx.net ([212.227.15.18]:45875 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728019AbfHMQVR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 12:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565713260;
        bh=uRHDvL3TndR8wGBn8RWaBtvuYQCKr4j/BBz8Ga9FesQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=FD4Yg2lq/EwvFJdKqcle/04/mM9YxkFkhJBujTJPAx7L4Tg7folHXQuavb+A0FUeL
         1p4LTYdw5W9/Wngcwog1CjPRTZ375rJdL75CG6B03kqa5CgihYalh1HP/seJi2P6M2
         AGbtQTjjKOCXRjNB2LSOc9yv+fV1dMpESbOfKFWw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MUGi9-1hoOJE43pT-00RFcV; Tue, 13 Aug 2019 18:21:00 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 07/13] dt-bindings: i2c: bcm2835: Add brcm,bcm2711 compatible
Date:   Tue, 13 Aug 2019 18:20:42 +0200
Message-Id: <1565713248-4906-8-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:0cRHZfQHKeaAt4ouWJuDoL7IzMS/0ykCsxm1ArsSFkmJwmbdWdv
 SoPXQAAsZXksgG77tAe3/UJGlqPk1jl0LKXDwsgQQoY0xvsHgzUlNWnErDNfwZtWG5n3Q6a
 NFZzMIZctTNntz7XfsE22RrJYddL45W6QLlFIeMeGJOlmNDx1WOCRPmvk0on4sPrtGDhybQ
 IaYaLlCG6JWIw83K6kEvA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/rvAzAeYiA0=:FN5M4wjfBAy5hu8tlP0v3T
 FDXwcxrxr5zUVQI1XKkrTKoFJDyzFHJE2XLGPoynZYwgpmok/hiG9urc2+ZmfO8oPUmqF9t3R
 jhfJqvhL1oXDDMeJHraVwQ4IP0YvBNIgluqw1j9Orb9gG1vHYFySZFu/y2DhDw54sVO101twT
 7k5XaACYS2Rmkfp7kdV+at/RaA4pMiYuuDm6Z5tRaYlzlCnNoP4XtIYatwsBSedjl1YVfIs6M
 PnCjrSVG1U4aP3BAfHEhVWkeQS6z/ElBY96JSOtMFRqWdanSnKZWTZWEZw0LnR4mm4GPWfQsJ
 ZRfbCAmJFpVZiii8BNl8Vt3fPhd7q68knKrzKeeEb3UVYZvqjkG1KIODDW0ijaJjhu1VuLW57
 CmC7tEA7tEyOI6Tc1NOb/5KoltbZBh0lyaM8kjdssXev+bF/ydu9qiEjQCQExQtMwBfe5IfbD
 ryZVglojt6AFGhzEajt2v2FdNg/OJt9+h1SOHhpg4Qt6Q2O19yKfgQ8ywfq061c27nSaPxxDx
 Mu9pjb5/n8Qhsg+ngZPkKX583i3z56fDyjgN+DyKAU/SECDEzxYsLZJzYRzZPdLSMuN9Nubhx
 UP6tN2J5RMCsQf6B/QtXNJoU41dDF35RJ8Nt0pAGKYqME13v2gKttZeKfmQ2SEoOvd2HHkjSZ
 WqFl8OIpdlmr6sPb8KTTjUZ2RfCQUa6RmOkrImsDWwwznSUxxkTf4TnfsRz2Ytc4ww+TE97L7
 5MP045jdalgfg383oDhnpX2NrDr3/BSoGqnksQR9SwsmvN+4xCraLL9BDJiD3p8/ystQvZzlP
 sU0zsVvkyzp3ouKy3cpuW8bfOKd0Mk3qT+5Iz585hXEUJ/yD07jbpAwnRA8eNcPC68Gd5FP78
 tBABbJcRmIvZb6Uj3GyRh6RWzlxgorRUFPfqpLm0S72X8nLVCC68mnoKu3v39MNlSqR4ZgtCM
 BGEWqEAtFCD/5zJnFYng56lRFT6ogZ9yLw3qagJ744nTNiPATpbRKzGIoVcS2bfFKa9gU+2qx
 Vn89/SYLzVRbrNQotYZ001sXafDKZKJOI7/BMnH+JD6cv3gz4bM0XdJ9j8yia4w0FdOxNSz8t
 24s1j29sZd81dTWe/fR9Ih4qMQHNr5xM6StHJcMG7qfkoROPEFMaz2oIqN/FqBcyZva9Gtu48
 SZSYvQV6mKYjiLq0IaTDwvIKJ7bfuOsSl297QSEoTUe+9WTA==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a new compatible for the BCM2711, which hasn't the clock stretch bug.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt b/=
Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
index e9de375..c9a6587 100644
=2D-- a/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt
@@ -1,7 +1,9 @@
 Broadcom BCM2835 I2C controller

 Required properties:
=2D- compatible : Should be "brcm,bcm2835-i2c".
+- compatible : Should be one of:
+	"brcm,bcm2711-i2c"
+	"brcm,bcm2835-i2c"
 - reg: Should contain register location and length.
 - interrupts: Should contain interrupt.
 - clocks : The clock feeding the I2C controller.
=2D-
2.7.4

