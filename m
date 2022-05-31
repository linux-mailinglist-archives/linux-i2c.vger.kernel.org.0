Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10F10538CA3
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 10:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236304AbiEaIUZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 04:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232875AbiEaIUY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 04:20:24 -0400
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F423691551;
        Tue, 31 May 2022 01:20:22 -0700 (PDT)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24V3YPPV004646;
        Tue, 31 May 2022 01:20:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pfpt0220; bh=8nxNsVGiL8Mk+63bqzVvln6mjStvrA/6MNl4uuUs9GE=;
 b=Xhx2c2XqoqoPBTQlyrJT7hDMd296SCNAHJWNPsHbCPp4bbI1+pMbcC1qpBla1tKD+ZSc
 8MaU0RS/VD6mCD3dBX/C3Tek7jhN/0tfWocUuoGTHlMGDCQc7XxO5Y6MUo4VS4RgUX7l
 cGOKZKy2YhqyZnAiv9ElymIEcWtTAi6AQAsKCPO1vq11ia5RGBmjqOn6kO5dCOgMKlws
 p+fNF16KR54/mLPFD3UGUu/tcOirYTZbVsE3Pl2FRWp4IggWu9IZDmYoSsweFEU0wbiw
 bnoc7oJdjS/4PulT6UnXXo9lNPt5YMfXX/QQ/14c8kmLdc+IAimdvYtskbjZqSzGYgGB 4A== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3gbk8n8cav-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 31 May 2022 01:20:20 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 31 May
 2022 01:20:18 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 31 May 2022 01:20:18 -0700
Received: from localhost.localdomain (unknown [10.110.150.250])
        by maili.marvell.com (Postfix) with ESMTP id D01AB3F7095;
        Tue, 31 May 2022 01:20:16 -0700 (PDT)
From:   Piyush Malgujar <pmalgujar@marvell.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <rric@kernel.org>, <wsa@kernel.org>, <sgarapati@marvell.com>,
        <cchavva@marvell.com>, Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v2 0/2] drivers: i2c: thunderx: Marvell thunderx i2c changes
Date:   Tue, 31 May 2022 01:19:32 -0700
Message-ID: <20220531081934.29238-1-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mqoAx37F0uG81wfBYwxBpJNNAz0rirNH
X-Proofpoint-GUID: mqoAx37F0uG81wfBYwxBpJNNAz0rirNH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-31_02,2022-05-30_03,2022-02-23_01
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

These patches includes the following changes:

- Handling clock divisor logic for Octeon SoC family using subsytem ID
- Support for high speed mode

Changes since V1:
* Fixed the build issue "incomplete definition of type 'struct pci_dev'"
Reported-by: kernel test robot <lkp@intel.com>

Piyush Malgujar (2):
  drivers: i2c: thunderx: octeontx2 clock divisor logic changes
  drivers: i2c: thunderx: Add support for High speed mode

 drivers/i2c/busses/i2c-octeon-core.c     | 84 +++++++++++++++++-------
 drivers/i2c/busses/i2c-octeon-core.h     | 18 +++++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  7 ++
 3 files changed, 85 insertions(+), 24 deletions(-)

-- 
2.17.1

