Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E96007DC373
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 01:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235776AbjJaAMO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Oct 2023 20:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235772AbjJaAMN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Oct 2023 20:12:13 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2117.outbound.protection.outlook.com [40.107.244.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6CBB3;
        Mon, 30 Oct 2023 17:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1RFuSawjZc2SWXjYkzSWi5ArCzoAyISeTgCd0XIipKxOkiTXVauMzI0GDQ5bqL44c7PE17rg0EmPJfHpMuI4woW4/LAxgxjTXjQfR55KiobS3y1SBmD0ddaG312WYKmqD9tPCas1rY/J2hOSayWLDQKamrnDQLFx4CBA6mK+7mP5h0be8TOJdDWGVvpVWqum7XQ2rD/EITYbWWHdyNCisosH3/HQof9r5pOV3Dh3/u/jWXgeDjqcdDqblR1IVlp4xYF7r5Xbd3yREu0DDTkjpCHjOvZuuefWefYX7igCYhN430I2tq6LyX+JxfH7yfzhosDnyo82iVcUTQkQQrACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79XTSpNPh8yggWvN33t26vl+zUZMcPti2pvLzCMs1IY=;
 b=PjiKDr7VUEV1CWaqB+k+33yl6Koz3tXcT1WSlovPWB+sylzj1emHHMKaRkj4E+lQ+Z0NJff1+O/+0qRTe9gLDwwzc0zeZGkcir8YKejBH5EHQVQokV9gyczXBmfRt2RtgSd291ezFoucwAIOLmlAAGvfeDVxv9AyR7+iFljwhqj51XvPk7kuys7ZFLU8lChvbV7ACxLjPdWA36xG+aIvkT2JeIHw3EBwKsLHjciUsL/2HXStDVQZfXiH7EMWXl2SZq9am5ngSb6B4ansq4bcwKbyf0GtLotJMqncCUi9p+mtiAZYXiTPJn5Q+2uQW2ks1KIpLNMabMVXwYAkFvmScw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79XTSpNPh8yggWvN33t26vl+zUZMcPti2pvLzCMs1IY=;
 b=qLPIcYRA9kgtBnM8K4r3ze7W3jpZG8Rgs6ztbEuz1jU5YT/+017gPmXprah2q3H96/+vQyeD0mrVzzhgqR33TDHseIEgFiKqtT/WloFOLaHYEJywCKLGd0qUOo8ulAQwnIl4/+QJMVoT0xInAy+jhoKO8yGJ317la6UptkPSe8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7475.prod.exchangelabs.com (2603:10b6:510:f2::9) by
 LV2PR01MB7744.prod.exchangelabs.com (2603:10b6:408:172::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.29; Tue, 31 Oct 2023 00:12:06 +0000
Received: from PH0PR01MB7475.prod.exchangelabs.com ([fe80::b84:304e:acf:afcb])
 by PH0PR01MB7475.prod.exchangelabs.com ([fe80::b84:304e:acf:afcb%6]) with
 mapi id 15.20.6907.032; Tue, 31 Oct 2023 00:12:05 +0000
Message-ID: <ab57ba73-ce62-43fc-9cb1-d2db1bd13cd9@os.amperecomputing.com>
Date:   Mon, 30 Oct 2023 17:12:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
To:     Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
 <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
 <ZQq2cT+/QCenR5gx@shikoro>
 <ba6d4378-b646-4514-3a45-4b6c951fbb9c@kalrayinc.com>
 <9219ad29-b9a3-4f07-81b5-43b4b6d9d178@os.amperecomputing.com>
 <d65lwrkji3rvw6r4jdcumo4zu3hbu6zpv6xq73hw6hcshvhtkw@jvuohb3f3loo>
 <3a305e74-2235-47ab-8564-0c594f24dc0a@os.amperecomputing.com>
 <ZRSEntqne/1y1ozq@shikoro>
 <1d56ceef-6573-43b9-a050-124c341a0698@linux.intel.com>
 <ZTpLHZZYtd1WgBu6@ninjato>
Content-Language: en-US
From:   Jan Bottorff <janb@os.amperecomputing.com>
In-Reply-To: <ZTpLHZZYtd1WgBu6@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0020.prod.exchangelabs.com (2603:10b6:a02:80::33)
 To PH0PR01MB7475.prod.exchangelabs.com (2603:10b6:510:f2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7475:EE_|LV2PR01MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 6577d21b-1bd0-492a-e5e7-08dbd9a603fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d8//oEo8AxgjmnKhwJIESXSr+pxCVHjQYip1wSeZpNZJjaygxxutWy1WsZM22Xprxmsu7AAe/xFLcGOpmnupkou9BDw7+uzh8WayL7Krgibfas7WtycARC2inrKnzFLwQdD+d2/Nwrm639jZM/LuhinL56keSWI5/enlR1Ljaz15HFjDBFs4/xjbqihKapvkzJ6CqbWDc8BZ4Li0/HjRbJZu+TMJG/9hSHkoSBylY75QbpQHuyNYKdWwsNp9r9J0Arl30mbclX2L9DzVlvZlP344iMWr8or4N6RcAfQCe8RkUzS3NxmzSooLFzpU1/hmQWbmIKi5CfMUICglfhz6h9p5tHVt2bnUZ17WrgUR0N7ENGuyuPAj5jbboiXjqxigDxVRqG5Bx4VCuJj+A5hkWzRPI6dI67o6zw/bvrWPSeDe3Yw1HugYV7pJMgU3ievmwj9+omH8Se8DnkT0vQAVisvO3MODfmp7RX37COuOY1SVFDFUYGnjWJcxJmNl+E+zlUSfg/wqSIl7UlsgR/8NRvwM6L0mo6HFrwIdY/gd/RXXatA6P8B6FvWFQOVuX+YaaeDdWK8eT5QfDZmBVS5cX8PRK5dF4OwOAvoQp9CwSKPSdXIl1JMvZj0S6QbMwJFdVUtr9OkJjsnHnvPziMEBhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7475.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(39850400004)(136003)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66946007)(66556008)(66476007)(110136005)(316002)(26005)(8936002)(8676002)(83380400001)(5660300002)(41300700001)(38100700002)(53546011)(6486002)(478600001)(6506007)(2906002)(6512007)(6666004)(31696002)(86362001)(921008)(31686004)(2616005)(7416002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGp1MDE1aUo5dCtwekNJNWRkUDlZMzhFcm5XS0I1ZU9QQXE2em1TdjNnbXRa?=
 =?utf-8?B?QkZZaGJnSUZET2ZYMCtmMVJwMUNjT2hZaUZ0V1V3VktVeUxNYURMVkZ0bWlr?=
 =?utf-8?B?UmRXajJaYzE4dExndVI0K252cXNpbHlKcFo2TjRiVFVkNFFrdzVpdVZsS1BD?=
 =?utf-8?B?M2tNZkN4amVPYVc2YVk5dm9yY3JQSzY5SnkwMkNjZU5kb2laVWJESXNDSzBJ?=
 =?utf-8?B?MUtSTWZkNHBuT1l2c3A3M0pIdGNkVEFudGVRTWZkaVdvVEY3RDZzS2RFUGhB?=
 =?utf-8?B?bGRGQnBUZkJ4ckZ6UVRVcnZ4QUNzTHlyZGtUV21JajkyUWFEVkNvTEJPZWRC?=
 =?utf-8?B?RnNmL2ZCVEI4VXdCajBCbXUxaGdlQk9yaEdicFZxcDUzT0N0bFBCd0F1M29j?=
 =?utf-8?B?V1JFMlRJMVlWK0UzWXRDT1diL1hUQXR2Rm01My82cGtMZk1oSHZlRlVCcEll?=
 =?utf-8?B?cEhycXplM0tYUjU4Sk96OGNlamxwejh0RXJ5QkdnM0w4VlRhYUoyZ3RNRHc4?=
 =?utf-8?B?OEJuTWdKYkx0OGRzNFd3c1dnUzdaR0ZjS3B4Z1NPVlFWelZvVHowSDdaV3dr?=
 =?utf-8?B?cEtYcXpJUjhxcmxEcTNkZHdsVGJ6eXNoZUN5L2FxUkVlWTIybVhmQW1aakhG?=
 =?utf-8?B?Z0xZc3Avc1daSnhCTUlESlVpWG8xamtnR05mWDNhejVvUlozT0ViRlN2WHY4?=
 =?utf-8?B?QldHTE1oaC95b1J6OXQ2VTFma1VXbFlYSEJMU3NjcDU0WVdRak4wVzhlVWlw?=
 =?utf-8?B?cTNxVWYvZVhVVjRoenI3SlUzRGNhSWVpcGhSVEdFTXcvQVBvbEl6d1RFWTNl?=
 =?utf-8?B?U0xBTTV4VkRIWGIrMHFiRGRsR0NRZjBLY3NVeGkvZWQvSDk3dXFsWmFyZXAy?=
 =?utf-8?B?WmVzSWpGdmxsNmc3aTFDaGw2SVF2U0IydHYzLy9HMDVSUHZzZmc0R3ZrdVZK?=
 =?utf-8?B?aWZwT1lPRUZpZDRzTGh3dnpyUFZHcWxKYU1CR1ovRHh5U3Y2eDFjOG1qbVFE?=
 =?utf-8?B?TFJ3S1N0eGNGSCt6U09QQjhzd21hSzV4NDhySEVxajMvMHFwZ1kxcWFXTWxh?=
 =?utf-8?B?Myt6UUk5QTBUSGNLU1ZjdEpNVmE1Kzl6YmhCbk1DdHF2WDhGUGZnaitzYTFK?=
 =?utf-8?B?UjB2a3hNWFdCN1BpME5KUFE4ZGZROXAyMlNQSkpSV0FLNnpYcHcyWU1Oaitk?=
 =?utf-8?B?bE9VQjdkcTQwSVpOV255RkZiQ0l5Tng1aFRNQlN5SnRZRlZKMjk1Z0JMM0Rm?=
 =?utf-8?B?bklPcFNMSThlOGdtZjNkR2MwaFlBMThNVU41T2l3eU9CcHlETndpMlA3VVMx?=
 =?utf-8?B?UFp6OTJnYm1ZN3lZdExJTlJzWkIwK21tWWU2Y1hCV0poVDVrMmpkNjFYbXFD?=
 =?utf-8?B?bjZETWJnYzgxMXh0ZDQwNlFDVzdwY0U1alJVMElDZUIwYW1ESzRwc1pjRVBt?=
 =?utf-8?B?R1BqdXRTdHBJVTMxUlNJYmFBcnp4WFQxeXRzcno5QjA2UUVma0NVZHRkVWdq?=
 =?utf-8?B?ekMzYWdMWTNyUFE4VEJadnNjYlltRTZ5SFgwT0NDaTVWZk96MmhQMVBsYkdP?=
 =?utf-8?B?SjZoajVkcUhkNit2aXJob1lNZ3ZoczJ2RjIwNmFPb3dBcmttVE44ZXJjcWJU?=
 =?utf-8?B?ZGdzdVUzcTNjOEpBZ3YxRjFKWkEwR0NKaHJwNjFmU0sxMUhGNlBmaWlORlhZ?=
 =?utf-8?B?ZEtvNjAwN29yQ2l4alM0RHhLNXBjY2M5cXFKN3NDcGxFajFpdXc2STNwRGxy?=
 =?utf-8?B?UUZIZjZUckNNY1ozMnQ4ZTM2V3RuRjJIUVJPMTZXekJndkpLeFBCaUNIaFpq?=
 =?utf-8?B?cEd4NCtyT05ZT3dsLzAvRzZLOEZNdkhZeVBFbXNOc1kwK2hXbG1Zc3RFS2FX?=
 =?utf-8?B?eUlHNzdta3lRbzl1YjhXRnU4SWVhMHpxbW1ycmZwcm40ay9QUnNiWlpMYWtG?=
 =?utf-8?B?L3dUc3czVWZ3Q2s3ZlhaNUpPTTQvSUtuU2RueHBYWG1hOHRuU1VuYW1mVXpY?=
 =?utf-8?B?RzkzVTJwR2liM0kwR0hhU0RFeDMxYUlSN1hrUFJPQUhvcU5FbzRJTnNrRVhV?=
 =?utf-8?B?eG5BbW5aRVlYK0ZqNTd3QWVvcFgvZlFKUUZrTmhsOEFuNi9rcnF5K3oxMUhy?=
 =?utf-8?B?Wlg4bU9VZ2pBOFZwZU4zTmZsQStjYk55eWJuOEZmV09QbkZxT0NycGlCVmtw?=
 =?utf-8?Q?g/KQnMTvkKs0xqf4fB+9zkw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6577d21b-1bd0-492a-e5e7-08dbd9a603fa
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7475.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 00:12:05.8830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4RIn5Ip/6ZGixUWRwFqVmnoVq4wbRaYqgefQnevAZipn379Wgh6omsj6sQ7Q2WEt9ukmiQsk2e9/17YbH6kudS0hZ6fX+82sN3gi+2gqLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7744
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/26/2023 4:18 AM, Wolfram Sang wrote:
> So, someone wants to come up with a patch to move to non-relaxed io
> accessors?
> 
Is the current thinking to just make writes to DW_IC_INTR_MASK use the 
non-relaxed variant or something more broad?

 From a safest functioning viewpoint, we talked about making all 
accessors default to non-relaxed variants. A couple of pretty good 
arguments from knowledgeable people favored this. I know there also was 
some concerns about potential performance impact this might have 
although the counter argument was this is a pretty low speed device so 
some extra cpu cycles on register accesses were not likely to degrade 
overall performance.

I could make the patch if we have consensus (or maintainers decision) on 
which way to go: 1) only writes to DW_IC_INTR_MASK are non-relaxed, 2) 
make all read/write accessors use the non-relaxed version.

I'm personally in camp #2, safety first, performance fine tuning later 
if needed. Latent missing barrier bugs are difficult and time consuming 
to find.

- Jan

