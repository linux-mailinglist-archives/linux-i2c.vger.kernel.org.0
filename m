Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE24FFA6C
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 15:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfD3NcN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 09:32:13 -0400
Received: from pbmsgap01.intersil.com ([192.157.179.201]:60252 "EHLO
        pbmsgap01.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfD3NcN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 09:32:13 -0400
X-Greylist: delayed 522 seconds by postgrey-1.27 at vger.kernel.org; Tue, 30 Apr 2019 09:32:12 EDT
Received: from pps.filterd (pbmsgap01.intersil.com [127.0.0.1])
        by pbmsgap01.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x3UDNIB7013557;
        Tue, 30 Apr 2019 09:23:18 -0400
Received: from pbmxdp01.intersil.corp (pbmxdp01.pb.intersil.com [132.158.200.222])
        by pbmsgap01.intersil.com with ESMTP id 2s4jky2hfv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 30 Apr 2019 09:23:18 -0400
Received: from pbmxdp03.intersil.corp (132.158.200.224) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Tue, 30 Apr 2019 09:23:16 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp03.intersil.corp (132.158.200.224) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Tue, 30 Apr 2019 09:23:16 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>
CC:     <devicetree@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/7] dts: r7s9210: Add RZ/A2 devices
Date:   Tue, 30 Apr 2019 08:23:02 -0500
Message-ID: <20190430132309.12473-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-04-30_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=617
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904300086
X-Proofpoint-Spam-Reason: mlx
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

So while I added RZ/A2 drivers a while back, I never actually added them
all to the device tree.

This series adds everything that is currently supported.

Chris Brandt (7):
  ARM: dts: r7s9210: Add RSPI
  ARM: dts: r7s9210: Add Ethernet support
  dt-bindings: i2c: riic: document r7s9210 support
  ARM: dts: r7s9210: Add RIIC support
  ARM: dts: r7s9210: Add SDHI support
  ARM: dts: r7s9210-rza2mevb: Add Ethernet support
  ARM: dts: r7s9210-rza2mevb: Add SDHI support

 Documentation/devicetree/bindings/i2c/i2c-riic.txt |   5 +-
 arch/arm/boot/dts/r7s9210-rza2mevb.dts             |  74 +++++++++
 arch/arm/boot/dts/r7s9210.dtsi                     | 170 +++++++++++++++++++++
 3 files changed, 248 insertions(+), 1 deletion(-)

-- 
2.16.1

