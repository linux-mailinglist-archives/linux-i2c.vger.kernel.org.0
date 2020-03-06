Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8325317BB04
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 11:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgCFK66 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 05:58:58 -0500
Received: from mail-db8eur05on2139.outbound.protection.outlook.com ([40.107.20.139]:15856
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726171AbgCFK66 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Mar 2020 05:58:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkPtRHoi3OtBmmNtMD5wgI7vClsOaEFTpMgDB5Qbxkwj/1qWww5g2JtQzEKoaVxWxAbu+BWYg+FvI08C/0Nrog4Q3F+hCJdexmO0Kk9k/pmTMMxHc+lk8Q8d+o3T+cQBnzLbwlywytI9HBe5B5Z3J1hWF5lexqe+WNsqZFzI6JrnLr6hGHJxucX9z78x1wD9jzdtLcQ4HpwpYtlI9kXAmB0VfYLcoohUxtjxyNQWXYQ3KQAC32zlTQH2oV2DWKRZDaAHHHIhRS1MfyMmysTY/83sRGkyaJ5etJFH+xyBKjHRlSYenDvYzLnOBoV0tP/TEiTUpag4gtW57HHVP8yXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDyiIdTAsHcRp48bXGg5b9StxDuiQRLFgphI7CCvyO4=;
 b=aUmghdUBDgWFEYd+hUgMDMvSzGuMkIoOYHj+ciZ4bWUm3I6WyhHvQhYPEMaGpKFEnr2uKT/jsqXu/9D4EiyAeRfKHSQfvbTjRP8qMN2GBc9yPZ2oy4EiKkahF28URmQozrRZteLZgnYWjh/420EpNPjIhyap9BOumFVDYH/FPY368RB//H/riZpR2Hdw0RGA9nQ7ZUbM5UIpNrdRNMPCQAWr+qODqHYpAG4+Gm7AtAhur3El0e/p9Q2hsHbreBSBiMMm+Wm2HNLPtqQTz2XI9ogRC54F3RRVqtbows/vd1QUbhXMks39zqyag7PWZkTnILpAw68fsJrNJnaG9Gc1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDyiIdTAsHcRp48bXGg5b9StxDuiQRLFgphI7CCvyO4=;
 b=YHrBCtDiCde6M6blc+l9vS4KkXa5+v8LyXH7nFARNxvLtuu2TXnK2GG5RS6NAaKjHfFFcYdRH3V9JH4Nidj1qvzh1Xnr3XeAwTXAhMiT73m+jUQT3L+5Lw9Zpzf6TyHoa0+Ny6f4Rms7Fau7AqLOPs6974Hcy0LZ5OGNnf64p/M=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3403.eurprd02.prod.outlook.com (52.134.71.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Fri, 6 Mar 2020 10:58:54 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::105:b8bf:3b3:5e17]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::105:b8bf:3b3:5e17%7]) with mapi id 15.20.2793.013; Fri, 6 Mar 2020
 10:58:54 +0000
Subject: Re: [PATCH v1 1/5] i2c: mux: pca954x: Refactor pca954x_irq_handler()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
References: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
 <31d8a07f-a841-d58b-ebc8-3cba39d00a95@axentia.se>
 <20200306100215.GS1224808@smile.fi.intel.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <102340b1-b742-82cb-8a31-147a8e338662@axentia.se>
Date:   Fri, 6 Mar 2020 11:58:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200306100215.GS1224808@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0401CA0070.eurprd04.prod.outlook.com
 (2603:10a6:3:19::38) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.137.122) by HE1PR0401CA0070.eurprd04.prod.outlook.com (2603:10a6:3:19::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.11 via Frontend Transport; Fri, 6 Mar 2020 10:58:53 +0000
X-Originating-IP: [213.112.137.122]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51ffa20a-f1b3-42f8-01fc-08d7c1bd5c43
X-MS-TrafficTypeDiagnostic: DB3PR0202MB3403:
X-Microsoft-Antispam-PRVS: <DB3PR0202MB34038495EE20894EFA0CFACFBCE30@DB3PR0202MB3403.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(39830400003)(396003)(136003)(366004)(376002)(346002)(199004)(189003)(8676002)(66476007)(8936002)(81156014)(4744005)(54906003)(316002)(66556008)(16576012)(16526019)(53546011)(6916009)(36916002)(66946007)(52116002)(186003)(26005)(81166006)(956004)(508600001)(36756003)(31696002)(6486002)(2616005)(4326008)(86362001)(5660300002)(6666004)(2906002)(31686004);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3403;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jiBlCMBRHk3VNy9jSXukZEowguuEHYCdIP5M1LSi+lpH6orFQb4YCryaqBCGguYO3zqzRWvkkLb8JMQBRPFB/EC4jMTSolmzkZFuuziX7uL3HIAbk2D85Mxw/n39ujo/J//jA0c6z8C6V00FnUQmpEws8cgw0qyJC1zmy+DwQzWfZXQvUti3rhykSaID1rixxayBSZwkZ6aOwHw/xuj/CzqTRnYI11Sh5/i/U5W2fUpaymhxRClU4UtNyDLax9WP4LsU3TcSk2eNJgSca0aGSDaX4rOQON/gJ8hzjl7eRXl2a8fYrLuthVegNkNeCaLnSZv2jIS1IO6HB/UUdr9qisHMXp3rfiyznuFrm2yVOC8qs/H6zhV3/Ww0FhsgPlYVXeJ4MtuLqqXXqcT1xoqPyYAT3LLMUq42CCUPpu6kFTKF5+sPs8d4FXPeTbKWBZCC
X-MS-Exchange-AntiSpam-MessageData: 4R1JE2TaQLgvLurN631p2dAkOetpMaJxz3BiVkpl8ZcXfdqExNEZP63gsXAz6p8ix/r1RWRJ+AljH2wlhO77lDAYMs+JWqSmgcA9h1/zczbELLVbeJTZKtlhrQ9sh62gupy1oCw2IOjGjNupyauLrQ==
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ffa20a-f1b3-42f8-01fc-08d7c1bd5c43
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 10:58:54.0177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEVoLc435nhuHHReSnuPLtXbwrzhskicDYJeopmcPQCpL7CTBzUkqRGMt02FtfVO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3403
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2020-03-06 11:02, Andy Shevchenko wrote:
> On Thu, Mar 05, 2020 at 09:34:46PM +0000, Peter Rosin wrote:
>> On 2020-03-05 16:53, Andy Shevchenko wrote:
>>> Refactor pca954x_irq_handler() to:
>>>   - use for_each_set_bit() macro
>>>   - use IRQ_RETVAL() macro
>>>
>>> Above change makes code easy to read and understand.
> 
>>> +	pending = ret >> PCA954X_IRQ_OFFSET;
>>> +	for_each_set_bit(i, &pending, data->chip->nchans)
>>> +		handle_nested_irq(irq_linear_revmap(data->irq, i));
>>> +
>>> +	return IRQ_RETVAL(pending);
>>
>> What if ret has some bit set above the bit corresponding to the last channel?
> 
> We will "handle" spurious interrupt.
> 
>> Maybe that's somehow not possible, but if that's the case it's not apparent.
> 
> So, does
> 
> 	pending = (ret >> PCA954X_IRQ_OFFSET) & (BIT(data->chip->nchans) - 1);
> 
> satisfy you?
> 

Yep, that's safer. Thanks!

Cheers,
Peter
