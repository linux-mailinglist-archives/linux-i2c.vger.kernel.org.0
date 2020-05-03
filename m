Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C23F1C2FD9
	for <lists+linux-i2c@lfdr.de>; Sun,  3 May 2020 23:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbgECVyc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 May 2020 17:54:32 -0400
Received: from mout.gmx.net ([212.227.17.20]:41729 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729117AbgECVya (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 3 May 2020 17:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1588542869;
        bh=OAlbvgtytXYz+CcyLbjAzIjeJ7FkyZJ2h99cuYoW4oA=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=NntIMDKxNiUnzJdsCRhxKx7lfDeLebT0+Epajl13xPsxQxu8V5m19THjtVJIdfa6H
         Pmxnbq2ZcvIEpNenwSE7tyIZIfSDi+eSp2uFX6+gfDhvwR79xQD6+cZt1dP3RNOpQa
         3472SVezPMblAaLmR7x5e/XejY0aGGPpPzVDU5Uw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [188.195.14.98] ([188.195.14.98]) by web-mail.gmx.net
 (3c-app-gmx-bap09.server.lan [172.19.172.79]) (via HTTP); Sun, 3 May 2020
 23:54:29 +0200
MIME-Version: 1.0
Message-ID: <trinity-75a89c3f-a865-466a-83a5-0f1c33e78d67-1588542869035@3c-app-gmx-bap09>
From:   "Andreas Sachs" <andilist@gmx.de>
To:     linux-i2c@vger.kernel.org
Subject: i2c with python: read block without cmd
Content-Type: text/plain; charset=UTF-8
Date:   Sun, 3 May 2020 23:54:29 +0200
Importance: normal
Sensitivity: Normal
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
X-Provags-ID: V03:K1:12PPOR3BU6+Udqo8xSOITBU/zc8nap7xccS+8ByhjcyQJS64eNq9DurzQB1cYo4BGmpbI
 2HYqq4D2WFISHNTbqzlq4cULVyN4zf4+0ey41H9bF4Zt+wCnbIkU+NGzUH2bKNv/UHgt270KGaHK
 CZkvv3Mm8lRRELHrZb47ftMD4fwmKhFTZeCES0OfAF5EHdJOpjCHAb01s5R2IT8X73DsRMDmAQLG
 dUkbWvbc5FE/Dzqs/wHedO9eE0d2acCewMT8cchy93WAFRrdwA6ve/uaENUo6MozM3wuimiL309b
 QI=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AWDKbmNDKGU=:7CKcBaPmgM0uwg0hknSE5b
 3kSBIE6nI4AK+xeFAj2aBze2e+p0kNZ7wW4vfpDGD2tVYSD8y9YwwhU2dZECCq7FqcF3DIchS
 MsiwwxIR7qb9Kw3ZQsAAwEvIevq6L/gpDeXTFkx/yAcF04el7yqil13Z/wEHgIwqL3NvU1DOV
 Z2XDhR9Ml7hLI6AYZVLgiYz/F/SFiAPHG8l777lq8m9ULSVjaAiLocN95Ikxd+7PJE0LqBc62
 P/1+uVi0o1Y5c2sQ4WKuT3pJAkPqWPUJoHC7rb/cV+Cb8+o1uLqDxzxt8IqpA85qA9VS7BpjX
 lM9zLLf+8401hrfcwav8vbj13ZWaQlA0pz8qI5Nzfp0UfJL9nL9ePJJeJZ56EVOitTCuwdqda
 AaMovCwWFADxIYp5ndv6brd9HrorrQguCVnYhG2y17eDieJB5BDwnDUejm0yLMuUsrhpdH9RN
 VXGL0qJF9VozONFYjYTkt8bqDDj/qgbpmMPPM3ypP+GHxYiMRKhhcVXYtJ1F67SHUuIo+Y5iB
 HXsGBrVtMScEwdIJaciXDmzjJqYDQmHM2TlBvc2yD8KeWN0r1NgDYyEx8xlWz6SQHQbjOlwwf
 lnCwAmjiS7Or0AxqyJZZz/l3R1+OpY1pHVgqYcjMn2aHZgr7sveaxwx5cJF6tZnHej3o2HOuh
 1u1rKHssR0NSZ/x1oKj3KzzZbI70SsSrL9R9m7sMT+lrUe8/mSX9JAKN4JUsb4+HEjh0=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,
i want to read several bytes from an i2c device without specifing a cmd=2E
I found a fork of i2c-tools Version 3 that makes that possible: https://gi=
thub=2Ecom/MLAB-project/i2c-tools=2E There are two new functions: write_i2c=
_block and read_i2c_block
=C2=A0=C2=A0 =C2=A0
I downloaded Version 4, added the code of the fork to Version 4 and built =
it=2E As far as I've tested it, it is working=2E

Is this also possible with the official version without patching it?=C2=A0
Thanks
Andreas
