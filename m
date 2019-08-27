Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9544C9F11D
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2019 19:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730159AbfH0RFO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Aug 2019 13:05:14 -0400
Received: from mout.gmx.net ([212.227.15.18]:49131 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727064AbfH0RFN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 27 Aug 2019 13:05:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566925495;
        bh=qthJNrtuM8pBdEZZab622Syq/04SnshDxQ2PcFBexUI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=O1NRNbF7UROsPwOAEuNmwj0fy5YwPUg+6aoazddAVyJM29gCdaJxpRW5jfpzR9OHS
         9AfQ9q1ctLb7l1nodx/hfMwDteO7cyVi0krBLkZzI2M0hJeqrPXr5pZqih9k9fOfm2
         ilHPgQpiqHaBlYg9mnZJ6pZ9GEnyRWBuwynjPLHk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MBFUT-1hsSHa1YRR-00AEF4; Tue, 27 Aug 2019 19:04:55 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Wolfram Sang <wsa@the-dreams.de>, Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/3] i2c: bcm2835: Add bcm2711 support
Date:   Tue, 27 Aug 2019 19:04:13 +0200
Message-Id: <1566925456-5928-1-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:LhDBa2yNwC3zkMWXPUedjbf8o6AioAbq0LbLHZXwEo4aC7tYQzD
 Xb0XKxS9Pc6pBNqha0wpQe1Vv/YmmI+VyPE4aIz5aWbPGnn44srnLfJR0S98Pm4xGuAWbNU
 Q9H4qh2WHP0qEJ0vS9itbiRGd0oISVrPGvq+I7d+zlBe70j4o0/hPx+3b1BfObqkAvTioUm
 Y3+4NjEbnmWQIZAG9bHBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qmYvDv6WUOU=:h+Hwczhx1xkpsbYEl+DZKl
 HKBg15n2enyQOAj5Ympa83hDK1jNjBr4UTotsJ+wQ014+Iuxv1fceEu/udwt5ms9Jbu3yaXR/
 DtcYG/FqhqFChFhaJPOQidi5J86W1la7onT5yyZaIx7I9g1rj0FgV6k3TFsEO3Eku5fWrKTzK
 A+MLffIBZmnW5175eaxYm9mSgwBt35jNQL04a1C8rdMJgMXotLX8hl6/7JDqGl+TWK3NYvW0m
 B+5kGeYdOWmXRjSsp74t7Nwei4zINiPvhdD+Uz9QFkyMgtH2wBNS/aEXdOy+Va9m/NmkAS+lq
 496awv4i3MaKf25ScX/K2nMndZVCwXJlk5MinGvO6O+9jRnBOJClwBvOISPMwnRKkeOFZ811G
 sKiX8+rCXCCpOKOEpUCjcqh0kihj+4bEdGXysYUEBho7gyAK/+FKzbvh275Qs442vIXD7SkaR
 vAoTJ0BFiUEXrs9/MoY26WQFZmI9pNTtJ6tNvf0itGhEN8oA3SEr+TpPnSQ8uFfTOrl/vD4+Y
 p3lLI3IBCn16WebelkM+QWoOvnsCRSQXkx1qKS09qbRQG7FfFk3Qgu+luCblXQCJC1VQWuajq
 xIS5uYBXY74k+3gTawsJBS7OL4NSdKR6PZtT+tDF1kGK3pYAHEPbGk1YhseEE23w0D+e9oxPm
 cGN+r/cQUjvwVQpEWhHS96cTcFYBDibTmmBq9/vdsY2CVskZScViKq+YoVWriSkTFnK59qya7
 saODvF8aACGP08VR1yOklrGIVe3ZKhQr9Gqx6tE93X+HChSZ+o0pxYaS05pf2So0MHui1nlXg
 crmjmpfg+VotbkQakYcCjFF+TWsY3BlI9jlw4VhLNZ7nVQzUlbOpIRWBuuvrpwrRd9+R496Vi
 b3XIvwGyH4KALjCif+ZH8sIVlBIfPvzO+d3mfB9J8qY83pdF2/60mhp9deNsteHoA6WvxLqWz
 UWryfFRNg2gHGvwFpQiTfgra+PnXEn2AsTEVG2Uw/3rUxiTXTou3/g3QaN2eCAMIYJm9sI3ef
 8f71tI3UrxOI2g18iWVFW3SqnoCHUpditduo08unh3j9m/YLlIaKXrLpK/ghSsPjQ1VtYfEuV
 rf9PUN082GiNn1sT3/UuQZZ0zQ0/Dai1kKiTQ341tS95lUmKQmGqoBRmWPyWavoE8WZ3ydwsl
 Hft1PsltlDajD4fMserQdzDzYYdx9jEBjJkIrv3tKcmYYQjg==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series has been split out of the recent Raspberry Pi 4 support
series [1]. I hope patch 1 and 2 have a chance to get into Linux 5.4.

Changes since split:
- add Rob's and Eric's Reviewed-by
- address Wolfram's comment regarding of_device_get_match_data
- add patch to distinguish the many interfaces on bcm2711

[1] - https://marc.info/?linux-arm-kernel&m=3D3D156571347332483

Stefan Wahren (3):
  dt-bindings: i2c: bcm2835: Add brcm,bcm2711 compatible
  i2c: bcm2835: Avoid clk stretch quirk for BCM2711
  i2c: bcm2835: Add full name of devicetree node to adapter name

 Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt |  4 +++-
 drivers/i2c/busses/i2c-bcm2835.c                           | 11 +++++++--=
--
 2 files changed, 10 insertions(+), 5 deletions(-)

=2D-
2.7.4

