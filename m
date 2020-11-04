Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745812A61B5
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Nov 2020 11:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728999AbgKDKfx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Nov 2020 05:35:53 -0500
Received: from mail.vivotek.com ([60.248.39.150]:37438 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728969AbgKDKfx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Nov 2020 05:35:53 -0500
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.42/8.16.0.42) with SMTP id 0A4AZePh012864;
        Wed, 4 Nov 2020 18:35:41 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=dkim; bh=+DU+CBQvYkPEsrF2UcgEp//Ykr0SOh1cwfAF3OxQ2tE=;
 b=bIZiUQBFJz39OpOaSq4gHURw13vewoTvesqjqmhISHyIdknwx49+KlvbgID6r2sirv2D
 S/Wr0F08PbUl28lLQaHfPLK6GrfPLcQ4auaDFj2A8sFi5xEs0ojUGfxZm/9epFfn8oVg
 xreW+xblGrpGkyXxk2rzb+KzhOtgGJlJVFQ= 
Received: from cas02.vivotek.tw ([192.168.0.59])
        by vivotekpps.vivotek.com with ESMTP id 34gtc345d8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 04 Nov 2020 18:35:40 +0800
Received: from MBS07.vivotek.tw ([fe80::2027:4d67:6c01:78d8]) by
 CAS02.vivotek.tw ([fe80::157e:3677:ef5b:27a2%11]) with mapi id
 14.03.0487.000; Wed, 4 Nov 2020 18:35:40 +0800
From:   <Michael.Wu@vatics.com>
To:     <wsa@kernel.org>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <morgan.chang@vatics.com>
Subject: Recall: [PATCH 2/2] i2c: designware: slave should do
 WRITE_REQUESTED before WRITE_RECEIVED
Thread-Topic: [PATCH 2/2] i2c: designware: slave should do WRITE_REQUESTED
 before WRITE_RECEIVED
Thread-Index: Adaylj0V9HMFwrLvFkOeW57CDSt2oA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date:   Wed, 4 Nov 2020 10:35:39 +0000
Message-ID: <5DB475451BAA174CB158B5E897FC1525B1295574@MBS07.vivotek.tw>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.17.134]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-04_06:2020-11-04,2020-11-04 signatures=0
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

TWljaGFlbC5XdSinZKm+r3EpIHdvdWxkIGxpa2UgdG8gcmVjYWxsIHRoZSBtZXNzYWdlLCAiW1BB
VENIIDIvMl0gaTJjOiBkZXNpZ253YXJlOiBzbGF2ZSBzaG91bGQgZG8gV1JJVEVfUkVRVUVTVEVE
IGJlZm9yZSBXUklURV9SRUNFSVZFRCIu
