Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37BEA464D43
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Dec 2021 12:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243209AbhLALv4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Dec 2021 06:51:56 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:48614 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S242456AbhLALvw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Dec 2021 06:51:52 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B18KtWG005616;
        Wed, 1 Dec 2021 12:48:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=d5m1UFk/3Up92017AsNcahPFJca6ECq5hi/I0JYLI3w=;
 b=3f8MgReHd4PIBLiCc6spSiM6XZJ4VCyXrSGC9eK5QohG81Tc9iZH+FFUlk2ORG4aM7Ca
 YszvrlF0BKW02tiQyNZu7/EBEZF+RpMnfD/3rk4m/Smxne52Ct4eciH6A+sgLhpM9h7a
 ItJ/dRoSshYdUObhrYGRibVGffEBwpRuE6yLknAlFI6WRKvL4ExPJrB6etKHwdkiizVt
 OBHLUDjqXz0gpktZ3fVSbWxb9LzLbHQFbK8/WymjtX6eXAxCn5sqVRvbqGgZLWd7pf9b
 X8PuYfTwJ2F3s59AEEXo0OU7c8USp9eULkbUI0pk8iGoOvJzQhLH4LJj8eQgzGgRgs8g OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cnx6ckdb3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Dec 2021 12:48:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA14F100034;
        Wed,  1 Dec 2021 12:48:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDE742194D5;
        Wed,  1 Dec 2021 12:48:10 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 1 Dec 2021 12:48:10
 +0100
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
CC:     <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>, <alain.volmat@foss.st.com>
Subject: [PATCH 0/2] i2c: stm32: A few cleanups
Date:   Wed, 1 Dec 2021 12:47:49 +0100
Message-ID: <20211201114751.828474-1-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-12-01_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A few cleanup, removal of unnecessary messages regarding bus busy
and recovering bus.
Make the function stm32f7_i2c_release_bus void since it is never
returning any error message, allowing to get rid of the error handling
within the calling function.

Alain Volmat (1):
  i2c: stm32: get rid of stm32f7_i2c_release_bus return value

Wolfram Sang (1):
  i2c: stm32f7: remove noisy and imprecise log messages

 drivers/i2c/busses/i2c-stm32f7.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

-- 
2.25.1

