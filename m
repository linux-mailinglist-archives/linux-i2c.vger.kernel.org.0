Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5753C45253F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Nov 2021 02:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351225AbhKPBsN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 15 Nov 2021 20:48:13 -0500
Received: from cnshjsmin03.nokia-sbell.com ([116.246.26.71]:2840 "EHLO
        CNSHJSMIN03.NOKIA-SBELL.COM" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351580AbhKPBqL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Nov 2021 20:46:11 -0500
X-AuditID: ac189297-845c57000000e1d5-30-61930caf20eb
Received: from CNSHPPEXCH1603.nsn-intra.net (Unknown_Domain [135.251.51.103])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by CNSHJSMIN03.NOKIA-SBELL.COM (Symantec Messaging Gateway) with SMTP id 01.BD.57813.FAC03916; Tue, 16 Nov 2021 09:43:11 +0800 (HKT)
Received: from CNSHPPEXCH1604.nsn-intra.net (135.251.51.104) by
 CNSHPPEXCH1603.nsn-intra.net (135.251.51.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 16 Nov 2021 09:43:11 +0800
Received: from CNSHPPEXCH1604.nsn-intra.net ([135.251.51.104]) by
 CNSHPPEXCH1604.nsn-intra.net ([135.251.51.104]) with mapi id 15.01.2242.012;
 Tue, 16 Nov 2021 09:43:11 +0800
From:   "Wang, Lawrence (NSB - CN/Hangzhou)" <lawrence.wang@nokia-sbell.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: RE: [PATCH] i2c: designware: Get HCNT/LCNT values from dts
Thread-Topic: [PATCH] i2c: designware: Get HCNT/LCNT values from dts
Thread-Index: AQHX2gQzxQOOCXSt8UerjvWLFXHhaawD2mMAgAACfwCAAIZzsP//guIAgAF6/fA=
Date:   Tue, 16 Nov 2021 01:43:11 +0000
Message-ID: <a08a7d9072164a5cac0166f075ad49b5@nokia-sbell.com>
References: <20211115093556.7154-1-lawrence.wang@nokia-sbell.com>
 <YZI0LuDK63+Wb7wi@smile.fi.intel.com> <YZI2RnFgO0Y75KlF@smile.fi.intel.com>
 <587c61a76c8547d0a36dd11071bfcb2d@nokia-sbell.com>
 <YZI+Gq06wk9Xfk6v@smile.fi.intel.com>
In-Reply-To: <YZI+Gq06wk9Xfk6v@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [135.251.51.115]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsXS/ts4XXc9z+REg1fr9C16m6YzWcx5s5zF
        ouPvF0aLy7vmsFlM2X6E3eLu/rmMDmwem1Z1snnMOxno8XmTXABzFJdNSmpOZllqkb5dAldG
        6+0ZrAUHmCqm/y1vYPzL2MXIySEhYCJx+tBXli5GLg4hgUNMEmebTzBCOP8YJb5cW8wO4Wxi
        lHgxeT1rFyMHB5uAl8TVydkg3SIC5hLrJi1iA6lhFljNJPFqy112kISwgLPEjpbtbBBFLhKn
        F+6Csv0kti45zg4yh0VAVeL1/FiQMK+AncTei8eZQWwhgTeMEg8eVoDYnAJGEk/6H7OC2IwC
        YhLfT61hArGZBcQlbj2ZzwTxgYDEkj3nmSFsUYmXj/+BnSkhoCTRtwGqXEdiwe5PbBC2tsSy
        ha+ZIdYKSpyc+YRlAqPYLCRTZyFpmYWkZRaSlgWMLKsYpZ39gj28gn09/QyM9fz8vT0ddYOd
        XH189Jz9fTcxAuNujcSk6TsYz839pneIkYmD8RCjBAezkggvS/SkRCHelMTKqtSi/Pii0pzU
        4kOM0hwsSuK8Rf8bEoUE0hNLUrNTUwtSi2CyTBycUg1MOadqxeya1179nXPeKWgxZ2b6o+Q/
        zWITtfhvafC4Xqjq3viizePHNU7OjJObPTd6Me20NF1luHurmmvShpxrx2zlfVwY3mmYMUyx
        Uv/yJWjtgn13p75YtZ7Hj+uQ8DGP5W8Yd3H7Tl61aa5q2fsZZw04NU53BnH4BvLGdfI8fNCb
        9frnxvev4iVVja3bVDL/KJ87eDKvqHXXh7igabPkjjLsqmtnW5LlW/RcInZnPcuFgud7a64+
        49vxdObq/VtmvLq03FvvyNtvE1NDnEVeBoRMCk+e2SLqyCvvI8yw/b52rdnvuTd/3LZw49p4
        SpetanLI8gvLhA+I992r9GztmzG7NXbDh+S3vgdlGL84KrEUZyQaajEXFScCAIuvMvoqAwAA
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


So, _this_ is a problem, try to fix it instead of band aiding here and there.
--------> Please read the commit message carefully. Current code have those parameters
for HCNT/LCNT. The only missing is no interface to config it in non-ACPI platform. That is 
what this patch do. It is not 'band aiding'


