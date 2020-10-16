Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 053E728FE2A
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Oct 2020 08:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404178AbgJPGTc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Oct 2020 02:19:32 -0400
Received: from mail.vivotek.com ([60.248.39.150]:34930 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404168AbgJPGT1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Oct 2020 02:19:27 -0400
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.42/8.16.0.42) with SMTP id 09G6JNo9016682;
        Fri, 16 Oct 2020 14:19:23 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=dkim; bh=+DU+CBQvYkPEsrF2UcgEp//Ykr0SOh1cwfAF3OxQ2tE=;
 b=M95DqZU8qO2is3efFsbBqbZd9my0uCU+kGb3eLpDneVHjDaEt9Rr8oY8iuddLuQ8TpGB
 +gZqrIwDVKynuBhaN/YoodZk/JeF+BPBc+jNRF/25gAvpMcZWUp/Ixv9mSsPRIrHggqR
 pFxE/FkEXgHQVFftef1a/ddEOLnOl82L6xk= 
Received: from cas01.vivotek.tw ([192.168.0.58])
        by vivotekpps.vivotek.com with ESMTP id 342yd1ccvn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 16 Oct 2020 14:19:23 +0800
Received: from MBS07.vivotek.tw ([fe80::2027:4d67:6c01:78d8]) by
 CAS01.vivotek.tw ([::1]) with mapi id 14.03.0487.000; Fri, 16 Oct 2020
 14:19:22 +0800
From:   <Michael.Wu@vatics.com>
To:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <morgan.chang@vatics.com>, <dean.hsiao@vatics.com>,
        <paul.chen@vatics.com>, <Michael.Wu@vatics.com>
Subject: Recall: [PATCH 2/2] i2c: designware: slave should do
 WRITE_REQUESTED before WRITE_RECEIVED
Thread-Topic: [PATCH 2/2] i2c: designware: slave should do WRITE_REQUESTED
 before WRITE_RECEIVED
Thread-Index: AdajhEmIMwQeos1qgUK+3jSvmqGh3g==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 35
X-FaxNumberOfPages: 0
Date:   Fri, 16 Oct 2020 06:19:21 +0000
Message-ID: <5DB475451BAA174CB158B5E897FC1525B1294486@MBS07.vivotek.tw>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.17.134]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-16_02:2020-10-16,2020-10-16 signatures=0
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

TWljaGFlbC5XdSinZKm+r3EpIHdvdWxkIGxpa2UgdG8gcmVjYWxsIHRoZSBtZXNzYWdlLCAiW1BB
VENIIDIvMl0gaTJjOiBkZXNpZ253YXJlOiBzbGF2ZSBzaG91bGQgZG8gV1JJVEVfUkVRVUVTVEVE
IGJlZm9yZSBXUklURV9SRUNFSVZFRCIu
