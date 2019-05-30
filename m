Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D98E32FA0D
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2019 12:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfE3KPD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 May 2019 06:15:03 -0400
Received: from mail.originalcard.eu ([80.211.22.181]:33752 "EHLO
        mail.originalcard.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727441AbfE3KPD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 May 2019 06:15:03 -0400
X-Greylist: delayed 462 seconds by postgrey-1.27 at vger.kernel.org; Thu, 30 May 2019 06:15:02 EDT
Received: by mail.originalcard.eu (Postfix, from userid 1001)
        id B76EF87CAD; Thu, 30 May 2019 12:07:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=originalcard.eu;
        s=mail; t=1559210839;
        bh=pU1Ykvzl3adJBZV7imduP50iKN5NTUdr3w+tN5tXtoc=;
        h=Date:From:To:Subject:From;
        b=4UtEAg54CVfKgBaox8qdZarvSxEdJGls0/xCZx4qD5hcnW+o9dn1hk2nLMKqefYrc
         DCOwuQjo/TzSiAOc7Ay1XjR70kXRiZ5HzjCiJD8jGK69Jcuev1wWOm0DzXpZfzVajI
         ClxJYcs6xVYPFXTdLzfaWlwjgh0EYkt+EQUZVX1s=
Received: by mail.originalcard.eu for <linux-i2c@vger.kernel.org>; Thu, 30 May 2019 10:07:05 GMT
Message-ID: <20190530100644-0.1.d.15zh.0.9dpjhhohfg@originalcard.eu>
Date:   Thu, 30 May 2019 10:07:05 GMT
From:   "Radoslav Dobrev" <radoslav.dobrev@originalcard.eu>
To:     <linux-i2c@vger.kernel.org>
Subject: =?UTF-8?Q?=D0=92=D0=B5=D0=BB=D0=B8=D0=BA=D0=B4=D0=B5=D0=BD=D1=81=D0=BA=D0=B8_=D0=B1=D0=BE=D0=BD=D1=83=D1=81=D0=B8?=
X-Mailer: mail.originalcard.eu
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=D0=97=D0=B4=D1=80=D0=B0=D0=B2=D0=B5=D0=B9=D1=82=D0=B5!

=D0=92=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=B8=D1=82=D0=B5 =D0=B7=D0=B0 =D1=85=
=D1=80=D0=B0=D0=BD=D0=B0 =D1=81=D0=B5 =D0=BD=D0=B0=D1=80=D0=B5=D0=B6=D0=B4=
=D0=B0=D1=82 =D1=81=D1=80=D0=B5=D0=B4 =D0=BB=D1=8E=D0=B1=D0=B8=D0=BC=D0=B8=
=D1=82=D0=B5 =D1=81=D0=BE=D1=86=D0=B8=D0=B0=D0=BB=D0=BD=D0=B8 =D0=BF=D1=80=
=D0=B8=D0=B4=D0=BE=D0=B1=D0=B8=D0=B2=D0=BA=D0=B8 =D0=BD=D0=B0 =D1=80=D0=B0=
=D0=B1=D0=BE=D1=82=D0=B5=D1=89=D0=B8=D1=82=D0=B5 =D1=85=D0=BE=D1=80=D0=B0=
 =D0=B8 =D1=81=D1=80=D0=B5=D0=B4 =D0=BD=D0=B0=D0=B9-=D0=BF=D1=80=D0=B5=D0=
=B4=D0=BF=D0=BE=D1=87=D0=B8=D1=82=D0=B0=D0=BD=D0=B8=D1=82=D0=B5 =D0=BD=D0=
=B0=D1=87=D0=B8=D0=BD=D0=B8 =D0=B7=D0=B0 =D1=81=D1=82=D0=B8=D0=BC=D1=83=D0=
=BB=D0=B8=D1=80=D0=B0=D0=BD=D0=B5 =D0=BE=D1=82 =D1=80=D0=B0=D0=B1=D0=BE=D1=
=82=D0=BE=D0=B4=D0=B0=D1=82=D0=B5=D0=BB=D0=B8=D1=82=D0=B5. =D0=A2=D0=B5 =D0=
=BF=D0=BE=D0=B4=D0=BE=D0=B1=D1=80=D1=8F=D0=B2=D0=B0=D1=82 =D0=B5=D1=84=D0=
=B5=D0=BA=D1=82=D0=B8=D0=B2=D0=BD=D0=BE=D1=81=D1=82=D1=82=D0=B0 =D0=B8 =D0=
=BF=D1=80=D0=BE=D0=B8=D0=B7=D0=B2=D0=BE=D0=B4=D0=B8=D1=82=D0=B5=D0=BB=D0=BD=
=D0=BE=D1=81=D1=82=D1=82=D0=B0 =D0=BD=D0=B0 =D0=92=D0=B0=D1=88=D0=B8=D1=82=
=D0=B5 =D1=81=D0=BB=D1=83=D0=B6=D0=B8=D1=82=D0=B5=D0=BB=D0=B8.

=D0=91=D0=BB=D0=B0=D0=B3=D0=BE=D0=B4=D0=B0=D1=80=D0=B5=D0=BD=D0=B8=D0=B5 =
=D0=BD=D0=B0 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=B8=D1=82=D0=B5 =D0=B7=
=D0=B0 =D1=85=D1=80=D0=B0=D0=BD=D0=B0 =D1=80=D0=B5=D0=B0=D0=BB=D0=B8=D0=B7=
=D0=B8=D1=80=D0=B0=D1=82=D0=B5 =D1=81=D0=BF=D0=B5=D1=81=D1=82=D1=8F=D0=B2=
=D0=B0=D0=BD=D0=B8=D1=8F =E2=80=93 =D1=81=D1=82=D0=BE=D0=B9=D0=BD=D0=BE=D1=
=81=D1=82=D1=82=D0=B0 =D0=BD=D0=B0 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=
=B8=D1=82=D0=B5 =D0=BD=D0=B5 =D1=81=D0=B5 =D0=BE=D0=B1=D0=BB=D0=B0=D0=B3=D0=
=B0 =D1=81 =D0=B4=D0=B0=D0=BD=D1=8A=D1=86=D0=B8 =D0=B8 =D0=BE=D1=81=D0=B8=
=D0=B3=D1=83=D1=80=D0=BE=D0=B2=D0=BA=D0=B8 =D0=B4=D0=BE 60=D0=BB=D0=B2 =D0=
=BC=D0=B5=D1=81=D0=B5=D1=87=D0=BD=D0=BE =D0=B7=D0=B0 =D0=B2=D1=81=D0=B5=D0=
=BA=D0=B8 =D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=BD=D0=B8=D0=BA, =D0=B0 =D0=B2=
 =D1=81=D1=8A=D1=89=D0=BE=D1=82=D0=BE =D0=B2=D1=80=D0=B5=D0=BC=D0=B5 =D0=BC=
=D0=BE=D1=82=D0=B8=D0=B2=D0=B0=D1=86=D0=B8=D1=8F=D1=82=D0=B0 =D0=B8 =D0=BF=
=D0=BE=D0=BA=D1=83=D0=BF=D0=B0=D1=82=D0=B5=D0=BB=D0=BD=D0=B0=D1=82=D0=B0 =
=D1=81=D0=BF=D0=BE=D1=81=D0=BE=D0=B1=D0=BD=D0=BE=D1=81=D1=82 =D0=BD=D0=B0=
 =D1=81=D0=BB=D1=83=D0=B6=D0=B8=D1=82=D0=B5=D0=BB=D0=B8=D1=82=D0=B5 =D0=BD=
=D0=B0=D1=80=D0=B0=D1=81=D1=82=D0=B2=D0=B0.

=D0=90=D0=BA=D0=BE =D0=BF=D1=80=D0=BE=D1=8F=D0=B2=D1=8F=D0=B2=D0=B0=D1=82=
=D0=B5 =D0=B8=D0=BD=D1=82=D0=B5=D1=80=D0=B5=D1=81 =D0=BA=D1=8A=D0=BC =D0=B2=
=D1=8A=D0=B7=D0=BC=D0=BE=D0=B6=D0=BD=D0=BE=D1=81=D1=82=D0=B8=D1=82=D0=B5 =
=D0=B7=D0=B0 =D0=B2=D1=8A=D0=B2=D0=B5=D0=B6=D0=B4=D0=B0=D0=BD=D0=B5 =D0=BD=
=D0=B0 =D0=B2=D0=B0=D1=83=D1=87=D0=B5=D1=80=D0=B8 =D0=B7=D0=B0 =D1=85=D1=80=
=D0=B0=D0=BD=D0=B0 =D0=B2=D1=8A=D0=B2 =D0=92=D0=B0=D1=88=D0=B0=D1=82=D0=B0=
 =D1=84=D0=B8=D1=80=D0=BC=D0=B0 =D0=B8 =D0=B6=D0=B5=D0=BB=D0=B0=D0=B5=D1=82=
=D0=B5 =D0=BF=D0=BE-=D0=BF=D0=BE=D0=B4=D1=80=D0=BE=D0=B1=D0=BD=D0=B0 =D0=B8=
=D0=BD=D1=84=D0=BE=D1=80=D0=BC=D0=B0=D1=86=D0=B8=D1=8F, =D0=B8=D0=B7=D0=BF=
=D1=80=D0=B0=D1=82=D0=B5=D1=82=D0=B5 =D0=BC=D0=B8 =D1=81=D1=8A=D0=BE=D0=B1=
=D1=89=D0=B5=D0=BD=D0=B8=D0=B5.


=D0=A0=D0=B0=D0=B4=D0=BE=D1=81=D0=BB=D0=B0=D0=B2 =D0=94=D0=BE=D0=B1=D1=80=
=D0=B5=D0=B2
Head of HR Benefit Team
www.originalcard.eu
