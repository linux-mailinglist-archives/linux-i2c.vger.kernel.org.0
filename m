Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75BC42AFBC
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 10:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfE0IGp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 04:06:45 -0400
Received: from mail.eatforyou.eu ([80.211.90.82]:41803 "EHLO mail.eatforyou.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbfE0IGo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 May 2019 04:06:44 -0400
X-Greylist: delayed 648 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 May 2019 04:06:43 EDT
Received: by mail.eatforyou.eu (Postfix, from userid 1001)
        id BB6D78762A; Mon, 27 May 2019 09:54:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eatforyou.eu; s=mail;
        t=1558943739; bh=vyeMfvM9p5OpBZcpaixj7OR3/HmtYFl6oOgS3h1qK0U=;
        h=Date:From:To:Subject:From;
        b=lEVGFUbVWTko4Mss0iVgbfMZLwFoB++26c7a5iM5bbmImI2QyWktmeMyhL4ly3eA9
         WHY5bu3xpLmwdJdQzpY5SNy5XpIHFXuBoZfmrJxZknFRX+JUZKdRfk/LQiJ1Cmkwzd
         SAqO7y63bXCFsWJw1emRN2qg3QruyFB1+6xsgU1o=
Received: by mail.eatforyou.eu for <linux-i2c@vger.kernel.org>; Mon, 27 May 2019 07:54:19 GMT
Message-ID: <20190527095339-0.1.a.my2.0.k76372r2og@eatforyou.eu>
Date:   Mon, 27 May 2019 07:54:19 GMT
From:   "Radoslav Dobrev" <radoslav.dobrev@eatforyou.eu>
To:     <linux-i2c@vger.kernel.org>
Subject: =?UTF-8?Q?=D0=92=D0=B5=D0=BB=D0=B8=D0=BA=D0=B4=D0=B5=D0=BD=D1=81=D0=BA=D0=B8_=D0=B1=D0=BE=D0=BD=D1=83=D1=81=D0=B8?=
X-Mailer: mail.eatforyou.eu
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=D0=97=D0=B4=D1=80=D0=B0=D0=B2=D0=B5=D0=B9=D1=82=D0=B5,

=D1=81=D1=8A=D0=B2=D1=80=D0=B5=D0=BC=D0=B5=D0=BD=D0=BD=D0=BE=D1=82=D0=BE =
=D0=B4=D0=BE=D0=BF=D0=BB=D0=B0=D1=89=D0=B0=D0=BD=D0=B5 =D0=BD=D0=B0 =D1=85=
=D1=80=D0=B0=D0=BD=D0=B0 =D0=BF=D0=BE=D0=B4 =D1=84=D0=BE=D1=80=D0=BC=D0=B0=
=D1=82=D0=B0 =D0=BD=D0=B0 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=B8 =D0=B7=
=D0=B0 =D1=85=D1=80=D0=B0=D0=BD=D0=B0, =D0=BA=D0=BE=D0=B8=D1=82=D0=BE =D0=
=BC=D0=BE=D0=B3=D0=B0=D1=82 =D0=B4=D0=B0 =D0=B1=D1=8A=D0=B4=D0=B0=D1=82 =D0=
=B8=D0=B7=D0=BF=D0=BE=D0=BB=D0=B7=D0=B2=D0=B0=D0=BD=D0=B8 =D0=B2 =D0=BD=D0=
=B0=D0=B9-=D0=B3=D0=BE=D0=BB=D1=8F=D0=BC=D0=B0=D1=82=D0=B0 =D0=BC=D1=80=D0=
=B5=D0=B6=D0=B0 =D0=BE=D1=82 =D0=B7=D0=B0=D0=B2=D0=B5=D0=B4=D0=B5=D0=BD=D0=
=B8=D1=8F =D0=B7=D0=B0 =D1=85=D1=80=D0=B0=D0=BD=D0=B5=D0=BD=D0=B5 =D0=B2 =
=D1=81=D1=82=D1=80=D0=B0=D0=BD=D0=B0=D1=82=D0=B0, =D0=B5 =D0=B8=D0=BD=D1=81=
=D1=82=D1=80=D1=83=D0=BC=D0=B5=D0=BD=D1=82, =D0=BA=D0=BE=D0=B9=D1=82=D0=BE=
 =D0=B5=D1=84=D0=B5=D0=BA=D1=82=D0=B8=D0=B2=D0=BD=D0=BE =D0=BF=D0=BE=D0=B2=
=D0=B8=D1=88=D0=B0=D0=B2=D0=B0 =D0=B5=D1=84=D0=B5=D0=BA=D1=82=D0=B8=D0=B2=
=D0=BD=D0=BE=D1=81=D1=82=D1=82=D0=B0 =D0=BD=D0=B0 =D0=BF=D0=B5=D1=80=D1=81=
=D0=BE=D0=BD=D0=B0=D0=BB=D0=B0.

=D0=98=D0=B7=D0=B1=D0=BE=D1=80=D1=8A=D1=82 =D0=BD=D0=B0 =D0=BD=D0=B0=D1=88=
=D0=B8=D1=82=D0=B5 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=B8 =D0=B7=D0=B0=
 =D1=85=D1=80=D0=B0=D0=BD=D0=B0 =D0=BA=D0=B0=D1=82=D0=BE =D1=84=D0=BE=D1=80=
=D0=BC=D0=B0 =D0=BD=D0=B0 =D1=81=D0=BE=D1=86=D0=B8=D0=B0=D0=BB=D0=BD=D0=B0=
 =D0=BF=D1=80=D0=B8=D0=B4=D0=BE=D0=B1=D0=B8=D0=B2=D0=BA=D0=B0 =D1=81=D0=B0=
 =D0=B7=D0=B0 =D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=BE=D0=B4=D0=B0=D1=82=D0=B5=
=D0=BB=D1=8F =D0=BD=D0=B5 =D1=81=D0=B0=D0=BC=D0=BE =D0=BF=D1=80=D0=B8=D0=B4=
=D0=BE=D0=B1=D0=B8=D0=B2=D0=B0=D0=BD=D0=B5 =D0=BD=D0=B0 =D0=BF=D1=80=D0=BE=
=D0=B4=D1=83=D0=BA=D1=82=D0=B8=D0=B2=D0=B5=D0=BD =D0=B8 =D0=BC=D0=BE=D1=82=
=D0=B8=D0=B2=D0=B8=D1=80=D0=B0=D0=BD =D0=B5=D0=BA=D0=B8=D0=BF, =D0=BD=D0=BE=
 =D0=B8 =D0=BD=D0=BE=D1=81=D1=8F=D1=82 =D1=84=D0=B8=D0=BD=D0=B0=D0=BD=D1=81=
=D0=BE=D0=B2=D0=B8 =D0=BE=D0=B1=D0=BB=D0=B0=D0=B3=D0=B8 - =D1=81=D1=82=D0=
=BE=D0=B9=D0=BD=D0=BE=D1=81=D1=82=D1=82=D0=B0 =D0=BD=D0=B0 =D0=B8=D0=B7=D1=
=80=D0=B0=D0=B7=D1=85=D0=BE=D0=B4=D0=B2=D0=B0=D0=BD=D0=B8=D1=82=D0=B5 =D1=
=81=D1=80=D0=B5=D0=B4=D1=81=D1=82=D0=B2=D0=B0 =D0=BD=D0=B5 =D1=81=D0=B5 =D0=
=BE=D0=B1=D0=BB=D0=B0=D0=B3=D0=B0=D1=82 =D1=81 =D0=B4=D0=B0=D0=BD=D1=8A=D0=
=BA.

=D0=A0=D0=B0=D0=B4=D0=B2=D0=B0=D0=BC=D0=B5 =D1=81=D0=B5 =D0=B4=D0=B0 =D0=92=
=D0=B8 =D0=BF=D1=80=D0=B5=D0=B4=D1=81=D1=82=D0=B0=D0=B2=D0=B8=D0=BC =D0=BE=
=D1=89=D0=B5 =D0=BF=D0=BE=D0=B2=D0=B5=D1=87=D0=B5 =D0=BF=D1=80=D0=B5=D0=B4=
=D0=B8=D0=BC=D1=81=D1=82=D0=B2=D0=B0, =D0=BA=D0=BE=D0=B8=D1=82=D0=BE =D0=B1=
=D0=B8=D1=85=D1=82=D0=B5 =D0=BF=D0=BE=D0=BB=D1=83=D1=87=D0=B8=D0=BB=D0=B8=
 =D1=81 =D0=BF=D0=BE=D0=BB=D0=B7=D0=B2=D0=B0=D0=BD=D0=B5=D1=82=D0=BE =D0=BD=
=D0=B0 =D0=BD=D0=B0=D1=88=D0=B8=D1=82=D0=B5 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=
=D1=80=D0=B8, =D0=BA=D0=B0=D1=82=D0=BE =D0=BD=D0=B0=D0=BF=D1=80=D0=B8=D0=BC=
=D0=B5=D1=80 =D0=BF=D0=BE=D0=BB=D0=B7=D0=B8=D1=82=D0=B5 =D0=B7=D0=B0 =D1=81=
=D0=BB=D1=83=D0=B6=D0=B8=D1=82=D0=B5=D0=BB=D0=B8=D1=82=D0=B5 =D0=92=D0=B8=
 =D0=B8 =D1=89=D0=B5 =D0=92=D0=B8 =D1=80=D0=B0=D0=B7=D0=BA=D0=B0=D0=B6=D0=
=B0 =D0=B7=D0=B0 =D0=B2=D1=8A=D0=B7=D0=BC=D0=BE=D0=B6=D0=BD=D0=BE=D1=81=D1=
=82=D0=B8=D1=82=D0=B5 =D0=BF=D1=80=D0=B8 =D1=82=D1=8F=D1=85=D0=BD=D0=BE=D1=
=82=D0=BE =D0=B8=D0=B7=D0=BF=D0=BE=D0=BB=D0=B7=D0=B2=D0=B0=D0=BD=D0=B5 - =
=D0=BC=D0=BE=D0=BB=D1=8F, =D0=BE=D0=B1=D0=B0=D0=B4=D0=B5=D1=82=D0=B5 =D1=81=
=D0=B5.


=D0=A0=D0=B0=D0=B4=D0=BE=D1=81=D0=BB=D0=B0=D0=B2 =D0=94=D0=BE=D0=B1=D1=80=
=D0=B5=D0=B2
Head of HR Benefit Team
www.eatforyou.eu
