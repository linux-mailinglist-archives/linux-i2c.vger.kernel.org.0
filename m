Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3002F3EF086
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 18:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbhHQRAW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 13:00:22 -0400
Received: from mout.gmx.net ([212.227.15.15]:41477 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229699AbhHQRAV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 13:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1629219567;
        bh=Wt1Gfa74aGaeFve/KcE/rZ8HsK7KgulSzUjTwDDDzic=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=YqnZmoDWdEJX63qtoDsogNo5I0JDR8I4jMW6MCgzzslVi99tCNJRaTAcKJljGbmWd
         OoFQ0QEXcPud34sod1PxOnoblTcP8vr1+A/jPmqTXgXYBLiPhXzwapxNcWnprBsBfd
         fdLIpgwsvyhpsK6kFDyOVJ1IsRA4G+CKxz1SzHCE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MDQeK-1mPM5Z2lQk-00ASZB; Tue, 17 Aug 2021 18:59:27 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Len Baker <len.baker@gmx.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: sun6i-pw2i: Prefer strscpy over strlcpy
Date:   Tue, 17 Aug 2021 18:58:59 +0200
Message-Id: <20210817165859.5429-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eUX8iGeHdrCmQwqUvgLJI1PlMs2ap/qw3UAD7StzS2DGEIG7K93
 YzsVmA0OcXTvwaWHsLlX39BPkLzsLWj7tJvfc822oUEqkPdNoLnY/gCdjYSrZ6qgyIah/+t
 IUopIqUu63BntXEAYza4UcJJF4lX+PtvrcNvds2/NGZN/svsDJ5hxEriwNeLUX535Tvzj6M
 VSM2eZBRQsR09fflwYnlA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5/Wish7CQms=:Gyfn31whfCPinEUsghZsBR
 rKAjkZ3YnZeIf+Z0lyPjJfYyaJMqErXIxdtVuibw5G/g9a+04PqpHu/q0kAXXjMsr1Hlp56u4
 YDrGcJnk5oojDeNF1AelD7615kS7RPE3VtLspP9wuCU6ZihaCIH7Oi1K1wtwwi+vvl1oi/xjo
 un2A/l8LjAzRlj7rJU5eM0eREwFA/F3ip/WliZAKHzeIxB5VpiODmhGz7j8Ob1rwALINB87Ty
 ZX5T1C68Dfeg60K7S08REZr12qT+Sa2poNM5VpAM6pMYhwkKAaZDplL1qDFL7XGkYtuiutl1P
 Qmyk+YgIyZWpOBut5Hl409CyNOF2/9ZKdXaRIy9fIdnJ6I+ATYpcUrCvetgYQmb6q2LKfEyaf
 zb+xYE8JOeXo6c7rtX7y8RbOkoJB4c9Ajp//HM3MqQACphD8j6SlPA5hzEQznRnvXVn++vIAQ
 b30NL9npDuWMf8xGs+5Qp40ge3jmEFqxen5WnchImWk1OO6tDpu370WpN3Is/rXEwVpaofeM/
 ZZvin71DwbVVjA8WRl64Ux8rct8tHccTbtG+XD97ufUMr7/zUXf+Sce7n5ruXDlffg5NhvXxX
 T3vzIGWP6fbMn/D0qO0SbPBMD71lJUXdelOq52+9VtRMk8z6EsDnMpHnjSttKSnjQhcuq2EE7
 vJVazlSW5jjkKRWjVmSzhUUSIkPTyDMFcnUxIEGw0Fiki9xpw6nvI64ix95BmrVX4hq4Cqwj2
 g3WjmyrVGxxEa9S9Hlw42trTYxB5mnSC2JEK6WLgxvmrQzPd2md083h7/YxXUhRmAwG4v+eL/
 s/A83N4SIey/2Y/jT1dGWFs3QXu9fPCEDbAUov+bTuVKRBQQvkoaiaQAxhe2lwzlIFPMGit3s
 I3RK737PKEMOMfNghXEcWXxItGrYVaPCx0uoO2jhFc5805njCfOyrnxN115GNjFCO9n8iOfDn
 uJ7nWWQjvNi4Vprl2BSUNrbKZKlvQvDbJQKQkcj97v1nq7wbmODowrREHNIjei1piMtMKhgAz
 93q55Ij+/W49q6xLNRH/k2SGR1R7R7+JFIazyJs7UdrtmavfOjCTxNUVoGzfDFQWFiaIq83sf
 Y7g33ZqX/kU5Y5VWkBexZ+JOM47rTmIKimNKBd0DxLTxTW1fSp7XWy58Q==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

strlcpy() reads the entire source buffer first. This read may exceed the
destination size limit. This is both inefficient and can lead to linear
read overflows if a source string is not NUL-terminated. The safe
replacement is strscpy().

This is a previous step in the path to remove the strlcpy() function
entirely from the kernel [1].

[1] https://github.com/KSPP/linux/issues/89

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-=
sun6i-p2wi.c
index 2f6f6468214d..9e3483f507ff 100644
=2D-- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -234,7 +234,7 @@ static int p2wi_probe(struct platform_device *pdev)
 	if (IS_ERR(p2wi->regs))
 		return PTR_ERR(p2wi->regs);

-	strlcpy(p2wi->adapter.name, pdev->name, sizeof(p2wi->adapter.name));
+	strscpy(p2wi->adapter.name, pdev->name, sizeof(p2wi->adapter.name));
 	irq =3D platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
=2D-
2.25.1

