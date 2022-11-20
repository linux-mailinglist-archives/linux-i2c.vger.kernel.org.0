Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65846315FD
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Nov 2022 20:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiKTTtQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Nov 2022 14:49:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiKTTtP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Nov 2022 14:49:15 -0500
Received: from CHE01-GV0-obe.outbound.protection.outlook.com (mail-gv0che01on2101.outbound.protection.outlook.com [40.107.23.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E1922B25;
        Sun, 20 Nov 2022 11:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkfVyMhtu+r8rJ92BjE9wBnl4Kul8IfatNu7Av45nH9+g27x1AmvcCcY5vFu540pKlXdVzIuWJuk+WwTUKcdSlB0lubD3ghM3S1/hK0gVeT3yST11ou4BevJxuqSA0JY/fdDWEbcQ6znrY2Z80lwFIH/zK2uaajdI85wJHWl98Z/vO1IdjmJPcJIPQENX/GB2C1PfyuBnDyrQGos548sxD3aMV+gLuzyojAyfvGJ5URRb4obYtocQoD0D+QDEdmIUiYcAQTGoaJGjD5gXnGlIRhLP1H4bkD94KTZvzwvdulIEn/gxvj/ROtrWHRqZiELKVUVtVMwoGncT+W36nzpzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dYXGtC5DiZsJTGl+BAeaSmLg5gsMqUWjk1TceT0Fos=;
 b=WzQ34QdhbBXPO7geqMSqtcsQS1yUiTyPImecc1zxv3jRPW7hL+9frc7k7Xac+pb//TdiLg24WfBK+v5VTMwOWFLewQtoimP0mWEKFWZKrwBSaWwpjLfYnbmU1iSsC3esxjk4uRoPneEhS3KsjzX13SPIaO0PrXWikNafSn0CMehh8BM98cyAPnvurYatuWbx/zOSJl7SKz/3+ivd23HRnUUrgbyYrrMVoMdmGDj2goiZ2jtjxRmZeHZG3uQWU13j6OdzEfwvi2PGBO3O8vN1h+sazUNZCvnHCG+uVphXl87kEJGbzDcL+wZqovyPZG3AN0NEZx8CApRBQ/cBl7UQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dYXGtC5DiZsJTGl+BAeaSmLg5gsMqUWjk1TceT0Fos=;
 b=vQMrIQYm5R/gUsSyFudlGB0GDIgC70vYFQW1OGVHPe8uuboIxrruZvUdbMlDrPfeQADQ64ZvRq9rM3WpNvm+3JU+vzlsawxziHYj8t2VJjh7agFtaI7vDCx36RkxhYcQCm2IGq5+WK8Dkp2E4HPApxWlrXZDxgtZ/0QAX+DtvsO0q9bFX83rNnPtouuYkSo1vrFPR1YNLGGBdv9NCIAjFI4IEiAJpu7Wxv5Am/io7K6DCWPHa3XlHEvbLTvpLZwwss81vR4g9I59hFvf74FLu5Lj6KMPAs488DUS/+VYg7TbBIUxq1XnvUv/8hz/L26z6UaxSlzPVqbL9gmP1mZN3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
Received: from GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:30::7) by
 ZR0P278MB0123.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:19::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Sun, 20 Nov 2022 19:49:10 +0000
Received: from GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 ([fe80::1c71:4a76:792c:3b06]) by GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 ([fe80::1c71:4a76:792c:3b06%6]) with mapi id 15.20.5834.015; Sun, 20 Nov 2022
 19:49:10 +0000
Date:   Sun, 20 Nov 2022 20:49:07 +0100
From:   Richard Leitner <richard.leitner@skidata.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 572/606] usb: usb251xb: Convert to i2c's .probe_new()
Message-ID: <Y3qEs6OkpgiJ5M7B@skidata.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-573-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-573-uwe@kleine-koenig.org>
X-ClientProxiedBy: FR2P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::6) To GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:30::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV0P278MB0211:EE_|ZR0P278MB0123:EE_
X-MS-Office365-Filtering-Correlation-Id: 567bf0f2-e707-4156-bfe2-08dacb304aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Twb3ubK+9qgk8Q+omNgWsWd8A3Cx8s3RujNC3OAw7ycC4hGtf8eaSMLhlE10zITIqMA9gW5o5u8sSWr/cA/Fyfms2x3rhtnutMYBNVtojf8gvNUoI+7VpLwaemPkl35oCkPDB0pyNovn9WK4jQR6lHq+WCLkoR0RkVEkLfOhQxqsF+r1AY8pOqhdVSXTwPStPtbgZXz6hITfizPEoJK1RRTqXM9/+VuOhVlU4G2Bpymdf1CHajaTMi3mLBzr2wE4l1hbKfP4x13L87Hfe8xhC6kKagbHnZUFVjEq97bX/oJfvNQxO3R85GWtfwHyPetIcnnJGTMeETNlcT0e0r+0YTvXtXfaQEKp8pKVhZWCbNqCzWa1mHA/p3MqPq1a4Kqu8aopmeoDJfOKIE7i7rguDnHKfPJEnwK5cWm0LflJM7f7gHz2A7KtNmu5oXzu2b2Xxk0cOsGMPJOT6oiZEdlhjNemX6zROYj++ofxkY93FLuZ6yXWButK/d9ecTIqm06xK7vccAhxCxIt5oNckWEVUqV5ysBtsdzT9AuEHltrpWKaP8tHL+9M+KOfXlf2VB6lb4rutgbi/zaeuRg0BIoGnUx6rx0ihTaT6KH957YA+pNlDYngDijzlcb2KjI6Tqu0nKk4f8Im5aE/5wGEHJlvyN3PhuNG1i/MIBP6jynXqsE7F4xi2W585I0g08Z5wVJX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39840400004)(346002)(396003)(366004)(451199015)(36756003)(558084003)(86362001)(26005)(38100700002)(186003)(6512007)(44832011)(2906002)(2616005)(54906003)(6916009)(7416002)(5660300002)(6506007)(8936002)(6666004)(6486002)(478600001)(66476007)(41300700001)(316002)(66556008)(66946007)(4326008)(8676002)(142923001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmQ4U0Q0cEN2Vmk1WVREKzFOUEVtbnhlcjdDMzBrVk81aklJcHhRWnBqRk1U?=
 =?utf-8?B?cGNCTEFwWjRHZXpQU2dYa0Z0R2o3NW5mR05ucmcvMTNuck1uUERIa0E3RE9u?=
 =?utf-8?B?ejFsZkJvbm9tbDFJcUk1SWlPK3o1VUExWXRWRGpJM0FITUJYY0tSNHhhUTlD?=
 =?utf-8?B?dmZKZ1kvYm4xVll6L0lNOWVqZ2VjZ0ZWV0NRTG5oR2JSWVo4TVlNUTByazBT?=
 =?utf-8?B?eDBlUUt6SkFTSTNwZUVjS0ovZEI4R1ZPR3lFWDg5Rzhoem9ScVVCM1B4VnJh?=
 =?utf-8?B?eWx3bCtYblBqSHNhbHdvcHZ1MCtkR2V4RFNCSW5iLzRyZmFDTVZnUXVRTlpK?=
 =?utf-8?B?K2RZQmhwVjZaMEovaFhZRy9IUGd4OEY5SjRaWHg2eFFCc0xBQ3NNbFljZTNa?=
 =?utf-8?B?MkQyQk9FUXhYdDZ1dW03M3dtNmhGektUSkx5V1NJU2phRStrVHArbGtUZUFZ?=
 =?utf-8?B?Yk9PVWhja0tSdVQrQVBWR1J3WHJRYklqb0ZqaVM0U21LRU55UDBtcy8vNmFI?=
 =?utf-8?B?VndRcWtLQklRYldRVUxNc1FUdXo1NThZYjAxNnM4QmdSbXRHNFhSNFhGczVL?=
 =?utf-8?B?N1RtWHU0U1pDcGtaVVBucGJaZDJLNHJEcXQ5a3d3VlRkTDBCeGxzclNFL2lK?=
 =?utf-8?B?Q1BvcDA0K2dORlJPZ2J0NnJuS3h4MlhpV0kwMFpsQ1o3Q2tMQ1hwUUpObnZk?=
 =?utf-8?B?anYzWlNTVHlYNEhadlhvK2RKZXhUSGszM0dlQzUwZ1dRSXZmWGJ6NHJFdmcy?=
 =?utf-8?B?SENqNHZHdGZqUXVJZHc4WS9hOWpGYnZ3bUY4SndFRlJFWlFEY2hCYzJuckdT?=
 =?utf-8?B?Nzk2SjV4eUVSN0V2eW5HajgyS1FvQ01TcTV0QmFYMTVVSVIrRGlLbmNZQ2hE?=
 =?utf-8?B?dFVFODFCZDZjVy9IM3FZbVVkUmY0MzRNNFhyWlI1WHR0RnNoQ005a1g5UzNO?=
 =?utf-8?B?L3doYlV2TmgrRE5xVHE4QVJnVWhKYjg0VFhNYUpmSHVOOFpBWCt1VlhGN0N4?=
 =?utf-8?B?eEs0ZlNPNDNoT3NoSmFuUG5iaXNaYll6YThmSldGSm9GMlJ0N2p5YVdDWEll?=
 =?utf-8?B?T0hBeCs3TGRjUGN2b2tWOXJPamZEL09SanVadmlxNWNEcmlncDNFbEtYbDhE?=
 =?utf-8?B?bVpicDh5MUZnV09HbTdjaU4vM2FHRkNHYVhXWGpsZkNpampHeEZoaHoyekFM?=
 =?utf-8?B?NnA3UjJtT0FWYlRKMDRLZDl3dFR6Tm1QK0VnSlZCNm00WDQvTXBxdWlrWmIw?=
 =?utf-8?B?V2ZzNjBMS1IwUlZyOFRyS1VOajlzc2lmb2JJbXhQZUIvYU14ZHlma0owNFk2?=
 =?utf-8?B?Q0pGMWluQTlLcTZReGJKSnJ6L3J2aW9BZ1hCQis1OWxYbi93TXRJY0JzOXhK?=
 =?utf-8?B?Qm1NODBJWFFGSWMzazBYT05QcnNOS2lOWXl1QWZUREVzYUt5V3VGVHdleVh4?=
 =?utf-8?B?UnF2UmdGUlQ2OFlaNjZWdzB2WGtOQ3pOSURnaENORlJpU1Myc0U3dUZTUVlp?=
 =?utf-8?B?TTJrdEF2emVDckgvTU4xUzJDdkRSbHdHeHNJTUszSDNTeG9wSTR5UTdsUHZh?=
 =?utf-8?B?Y3hEQklBSUpyTFRwSDdMSDdGUGI4WWxkS2RDcitOUHRHWEFmeVV6OTdBMDZx?=
 =?utf-8?B?V09TVFBLaGJhcDU4c1Qvc00rZHVmRXNVa3pCRzlkR3dHaytNSHZjejUzV1Rk?=
 =?utf-8?B?Z3pnZmtWR0tVWnViRDFuLzRaNERlaGVsdk5MNDRHU2Z0aFlOZDc4V3dEUUN0?=
 =?utf-8?B?RzRITWc1QTJSV0FlR0N3TGZTelJHL0JNSmNvSHMzS3BJK0hmaDVhUGhORGND?=
 =?utf-8?B?UFc3TmlVN0FkcFppc21WWkJZRndJVDRqblBIdTdZem1haXVXa0xZNXpYSzNY?=
 =?utf-8?B?eFR2SGNLNElOMmRDVGg1SjZBS0ZXdEcyR1d0dHI0Q0tNZUZ2dEVmd0lsM25L?=
 =?utf-8?B?VnVIRkRXSlNYMnVWeTJFcUR3bGZ2UmxDbi9ZY1VhamlET2FzaWJZVU1Ba3cx?=
 =?utf-8?B?WG5wdGxjRmtraTQyVXFYVS9BcG0rbXI5aVBtUjJVMnQxc1JXN2Q3bHhDdG1s?=
 =?utf-8?B?V2ZsRE10WEZMVmZzVm9HMi9tY3dhMmpTTXhvZU4yM2I3Nlo0REdxd1lDejdS?=
 =?utf-8?B?WTNQclhiOVdZYXpuRjNRaXdrNXdvS0RIR1piM2FaaHY3YmlHSVpVUGR0bTYw?=
 =?utf-8?B?TFE9PQ==?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567bf0f2-e707-4156-bfe2-08dacb304aed
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0211.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2022 19:49:10.2935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkiqTbKM+IMcOtwtlCvQ9kyyHbY1gEfre+k3QW//+Gzf5jLzChIWjby7TemhNC/MKxSCH6Fi04n00nCHF4Uuf3TgL5Rec/tVwoJMnM6Jey8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0123
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:06PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.

Acked-by: Richard Leitner <richard.leitner@skidata.com>

regards;rl
