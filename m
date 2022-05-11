Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB3CA52345E
	for <lists+linux-i2c@lfdr.de>; Wed, 11 May 2022 15:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiEKNhR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 May 2022 09:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239471AbiEKNhQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 May 2022 09:37:16 -0400
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5600A666A8;
        Wed, 11 May 2022 06:37:12 -0700 (PDT)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24B9kYZM021507;
        Wed, 11 May 2022 06:37:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pfpt0220; bh=s1VFbHSOZMgn76HuMJsIhJOFmt+OOy+9edoZzzNLU+E=;
 b=EXVBc3hFwy0N93U6uT2gqPcZ4kJlo2QDfjf6YWlSsMGwsjzBzbcABw7R7VN6K5dmsTVh
 A/70qc2W+WNoZeyv/whiF79rJmyB1FT1lr8Rw1nw/q/iw9G+sfOjgBGtyX+gNopFKRAP
 ryuoNa+BB+Das3QLB5i9zQ8qMCKMh8xOtMKH0GBqjAtwA6d94HByQaWvyhwC/iQlroq8
 7MIwM2Y1DyiLb7oz1xrX44ocbZR4fkLso7hJPT7gxYz5EhzjwM4AegLuq/52a0yCCFlR
 G7zz9olT14GtQv72cX7Q2X/lnQXoKc/1toj6I1r1iHNktnQJOnzVwBpEPP+bR155tvtR 0Q== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3g0at20u9q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 11 May 2022 06:37:11 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 11 May
 2022 06:37:09 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 11 May 2022 06:37:09 -0700
Received: from localhost.localdomain (unknown [10.110.150.250])
        by maili.marvell.com (Postfix) with ESMTP id 651553F7094;
        Wed, 11 May 2022 06:37:09 -0700 (PDT)
From:   Piyush Malgujar <pmalgujar@marvell.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <sgarapati@marvell.com>, <sbalcerak@marvell.com>,
        <cchavva@marvell.com>, Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH 0/3] drivers: i2c: thunderx: Marvell thunderx i2c changes
Date:   Wed, 11 May 2022 06:36:56 -0700
Message-ID: <20220511133659.29176-1-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GSmvG9E0VzvZcjZtqKrKhdDslS6KK9L1
X-Proofpoint-GUID: GSmvG9E0VzvZcjZtqKrKhdDslS6KK9L1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_05,2022-05-11_01,2022-02-23_01
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

These patches includes the following changes:

- Handling clock divisor logic for Octeon SoC family using subsytem ID
- Support for high speed mode
- Setting the fwnode so that driver can work with ACPI defined TWSI
  controllers.

Piyush Malgujar (3):
  drivers: i2c: thunderx: octeontx2 clock divisor logic changes
  drivers: i2c: thunderx: Add support for High speed mode
  drivers: i2c: thunderx: Allow driver to work with ACPI defined TWSI 	
    	controllers

 drivers/i2c/busses/i2c-octeon-core.c     | 84 +++++++++++++++++-------
 drivers/i2c/busses/i2c-octeon-core.h     | 17 +++++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  8 +++
 3 files changed, 85 insertions(+), 24 deletions(-)

-- 
2.17.1

