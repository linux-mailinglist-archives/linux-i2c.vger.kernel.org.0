Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6D92E1914
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Dec 2020 07:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgLWGqG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Dec 2020 01:46:06 -0500
Received: from 206.186.37.106.static.bjtelecom.net ([106.37.186.206]:48678
        "EHLO mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726069AbgLWGqF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Dec 2020 01:46:05 -0500
X-Greylist: delayed 830 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Dec 2020 01:46:03 EST
X-UUID: 2c40df7a9298418d87e185d97e96f7bd-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=lTRXf7HghnKJkYxV77mITDuIuRXMYK+T/YA/4yN896Q=;
        b=XTmUCo09n6SoZOkkVc7fWw4ya4HUsF/8zmzUs7UjgBXq7YffdnWquyB1JsCYn7HMs7w0f3p8QRYxU6N4y96Gj504R7YZch+SPPILIqnSk8sI2G0WZUePaTGxCGDKFMCxU5A3WbQNg71fJ81lrqN9DKimTBP8QVKL73i+ge8nrhg=;
X-UUID: 2c40df7a9298418d87e185d97e96f7bd-20201223
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 224065552; Wed, 23 Dec 2020 14:31:18 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 23 Dec
 2020 14:31:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 14:31:16 +0800
Message-ID: <1608705077.25719.66.camel@mhfsdcap03>
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
From:   Qii Wang <qii.wang@mediatek.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Date:   Wed, 23 Dec 2020 14:31:17 +0800
In-Reply-To: <765c182a-5c68-b408-85ca-f757e891090e@ti.com>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
         <20201202153543.GG874@kunai> <1606958735.25719.29.camel@mhfsdcap03>
         <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
         <1607326431.25719.33.camel@mhfsdcap03>
         <a9cb5ba5-f3ce-3f82-15cc-30419bb70f4e@ti.com>
         <1607565387.25719.43.camel@mhfsdcap03>
         <e83ab23b-81f2-620c-039b-9cadd84a39fa@ti.com>
         <1607935685.25719.49.camel@mhfsdcap03>
         <765c182a-5c68-b408-85ca-f757e891090e@ti.com>
Content-Type: text/plain
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 69890E8737225DC682D784A8471C838BCED96D5F5DC6F27F7EEFAC0FA20E67972000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgc2lyczoNCglJZiB0aGVyZSBpcyBubyBuZXcgY29tbWVudCwgSSB3aWxsIHJlc2VudCBpdCBp
biA1LjExLg0K

