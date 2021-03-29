Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89EAD34CFF4
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 14:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhC2MVg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 08:21:36 -0400
Received: from mail-eopbgr700139.outbound.protection.outlook.com ([40.107.70.139]:32609
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229910AbhC2MVV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 08:21:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zfc20Qw9e/TNNaijHZhO3okeaqI8pHcQmOM5QxfujkXcXKQJiAVtyAHBRQuD2LP48vzV1VFBmUWjkgv5OYDFvBWLreuV//PIyaMIARVaGCzoR2sznRJiamNe5z3yFpW/TjQuSAP4lReJE91UF60COwh5cc/kGdTKkHW12Cf8ENfCJHAHX9inQINq2lc48aswDtVsiSxbH2e+ltahUBeCXrM6DMZ6p3AuUKZUtcNK+eNF6rdla/yt/RXE9YcOWcAQCN3k6oFI4HGIb4ZnOOoIxzZMerN0QEeMVHMBsMuhV71HGXPbiHcEtSjf//1k/L6jGWTu8AyXxOij75vKrsLx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqHjPS2ZFMbpE/ZK4aGBE+Do3ZagtZqKtL07G3kJyQk=;
 b=nxmjNRt/QvysAT/o5tkJzjMNJL8vl7uLP86jnigVDHwfsqO0Rr0pOmDXrOybw4iDKpEyfMYJTNFIzlv4tvWHtCtLaNkrJ/t5Vyh5h5uDrd7xSn26BF5IDk64PRviAB5qFMDg/L9JMFOjpyjwXXSJz2P9DbYO04UcMyB3DU6v46qk2xLkJGM2lxQ4v26DNxik9TetPwi/UmNbs9Xy8A1dYXE6+k4pplGjr1qbs7AkdTFi9LfZDiWYtPk/iexAc9cQg8XX3aM6zy353rrSUH0LMmv4kFpa+UE3jBLiDSNJVIO4MLGa0u9h0F9/oBD+7SWfg7X5cRO8DRrm16VXPlFcMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqHjPS2ZFMbpE/ZK4aGBE+Do3ZagtZqKtL07G3kJyQk=;
 b=svAcFRgLmDuQCgmn8Jne2NpJjhPpc9Ce6peOafpVGVPMGNTRgADyfdnU0mReiQAcB4Tbfl7A5WclA4xgSyFM6GTWn+dPgjOoc8LVbwOctNJng7sK9FaZmWRxRlY/MXmkZto6h5s6y7OBvwuvuHBQojsTntDq+yp/evCmZMiH0rE=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none;os.amperecomputing.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6273.prod.exchangelabs.com (2603:10b6:303:65::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25; Mon, 29 Mar 2021 12:21:18 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 12:21:18 +0000
Subject: Re: [PATCH v1 0/3] Add Aspeed SSIF BMC driver
From:   Quan Nguyen <quan@os.amperecomputing.com>
To:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20210329120914.4527-1-quan@os.amperecomputing.com>
Message-ID: <99817f47-a597-e486-c75e-e631d86bc46f@os.amperecomputing.com>
Date:   Mon, 29 Mar 2021 19:20:56 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
In-Reply-To: <20210329120914.4527-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR0302CA0009.apcprd03.prod.outlook.com
 (2603:1096:202::19) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.32.128] (118.69.219.201) by HK2PR0302CA0009.apcprd03.prod.outlook.com (2603:1096:202::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.14 via Frontend Transport; Mon, 29 Mar 2021 12:21:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db83c537-3bed-4912-e9c6-08d8f2ad278a
X-MS-TrafficTypeDiagnostic: MW4PR01MB6273:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB62731E89EB44132FB754E906F27E9@MW4PR01MB6273.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gdhr2/KylfO6kNYOUpWk9vfrjE/2LPcQBVwVSady0laAZKJan8ajvG1qY5L11aTMAzYs9l7w4TADJBB2BB99zQ1+mMGHrZAC/t8x684gTg9sxxYXINfMUblPRHYwVeXJceE5VYWfA0ebtFQ5TTcNxsdHjyKV6rMM0ntGz5edOpsBzFb1rHYiBJiAiertgPI2yiLrghkE/EN6DkZYJehWwwUe6RXwKK+9KwV4rW7rnGcjDwnaIZFIz+hpe7KN//YkRGhITZdfa9lYygH64ZNqwbZxTlvySc2aNtbR/2aNeZx3aTErVC62/EDBySOHP5BLO5Vq7Sdd1R/W90YwH0AQsDanyoowiMcml5ljP0JTP5H0NvazKdtz3qaGxVyS1fq4lKErdZI1GWJVa9faxT4GMI//ncWp44lfiwRQF3H+E2qnvEiAaMRH+Y1VI8Z0wc8g8BLO3o/Xvm6BA7x0PjG9hoceyZAANvE+gMJfdBpjczKpch/uQXrWR8hSc5WZGg+DP5FpExbAq5K2vxcFOMX+WAXHrbROCY3TznM0krp58FD8K92CarKwXXCdimPArHT83u0zxzTT7c0I/mw70KW7TmnYyp9WBeDHPbKsxQUMX8iG4cb04KC5qyDtC1B5Xr2EhIuBEb3Z63VL0CpBkb0TL3I5SbZ4st4M2eYTYG7+gtiOvGfuGdHijYWrEXm5lnPNmlc80ZXxzcMnVlx5fRXRpFlS/NwSjVtW/zD1yr3lSl4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39840400004)(376002)(366004)(396003)(53546011)(66556008)(186003)(956004)(2616005)(7416002)(26005)(16526019)(107886003)(316002)(31686004)(4326008)(110136005)(8676002)(16576012)(8936002)(52116002)(54906003)(6486002)(478600001)(66946007)(2906002)(5660300002)(6666004)(38100700001)(921005)(86362001)(83380400001)(31696002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?alR2OW9IM1RBMjVQaG5HRGRXL1BDMFYyMzJvUjM5VUZXbGpSZlh6dzJscVJJ?=
 =?utf-8?B?ZjlybzJ3UUIzWnpvczdJZzYxZmtvRUhqNjZkYmdTZHFTV3ZoRjZuNDVieFVN?=
 =?utf-8?B?dEJwYWtuSDYrZTcvWURPQ0lRd3c5TXVxUk9oT3BUbHV3Nms4SEpyMkRsVFVL?=
 =?utf-8?B?b0tja2RGNWlUOUd1bEcwbjkvUVdjeFkyZGtGMUwyODVrUlV6WTV0L2RkMEdo?=
 =?utf-8?B?VitZSWplaFNhOHNicnBGTEtHZG9tbTcrSldMZWtIQ2xJMmluU1BFOFM2YUl4?=
 =?utf-8?B?cDlvOVp5Y3B3d3FvT0Vwb3ZueEhVVC9NVmRyc1RWVDlJb3JBWWZYdGpFK2tL?=
 =?utf-8?B?VUJqVXl4Q3JFVnNETXkyWmFVMGJkaURLOE1WRVZlODhqZVd6SFg4cTF5cXBC?=
 =?utf-8?B?cGxLNjdCeHZiMDY2Q0VNeklFQWswRzN5aWlXaXhZUlNZbkd5YTV2K1JlWnRT?=
 =?utf-8?B?L3RMV25KT2RTQWlaWnVmcmhaOXVFWU1oUVY2S1dKM2o0YThhVWR3OWRyaElu?=
 =?utf-8?B?anZ0c2tYMHg2b1NVQWsyY0NOTWZ4cXEyRnVoWE85cm1tdUVaLzV2aHVMc2NW?=
 =?utf-8?B?YXFxa0QwOTByM2c1eWlnQWJkd25tdUtuaTUvZjhRNVhURnhDSWZzUFl1UkFa?=
 =?utf-8?B?d0pYenlwUWcwZDhmK2pONlpaZnFsQ3dvL2Q2V0Z6MWI3aVNUV29xQndScHRU?=
 =?utf-8?B?MmZvcm1qK3FtU0FENFFjejl6aytFOFlydERKU0FFaVc4Q0JwMmo5MDc4Szgy?=
 =?utf-8?B?RE81K3JKMTFFNXF3emM0RzE5blhNeWxUcE1uZEQxL1RoTFFuQ0ExMkRMb1Fh?=
 =?utf-8?B?eTkxeG44ZE5oaGRiS2t3NFBQYWFJTTJLNzQ0M2Q3QTZIM25qZDRJUjE1NHlP?=
 =?utf-8?B?OVd3Um5DZ1lMZndDc1VwcXJ5RU41bHdnVE9kNll2VFJONm1rZ3UyRXdUeWJi?=
 =?utf-8?B?d0xKTGRXbXF4V3ZDY2VrK0srSkNmOWYrY21qSEFGOU5NUmxJc0VyeG1FWmZq?=
 =?utf-8?B?WHZiRkk3bFZIMGIwUGtKZVliNjhZTUZmVzJ4bGFNb0VLUVNqVWlCbUtlM2Rr?=
 =?utf-8?B?a0k4WE1GK3NMNEJ4WU0yU1NjeTU5UnhSdmYvZHR3NlM0dWxGWjM5ckdtVWNP?=
 =?utf-8?B?QU4waHVWMVBPbXJrQXd2UFJWK3Y4bzVzOG9NSzI2ZkVEWmprdXVJbkp4ZGR0?=
 =?utf-8?B?eThCOFdFcVZIODlMdEI2cEo3bkV6V0dYdGZycGtScC9qVjFRdlRoS0N2V2R4?=
 =?utf-8?B?RXI4di9peHZHVzVvSlp3NE9CL1F2emJBQkU1aXBQdm94MXMyY0piWVlaZUpW?=
 =?utf-8?B?d1V6R3pKSU11OXU2d1NidGVkK0Y5SjBqZjRYc0R4VEJlcDlpMmNDcmpIcVVy?=
 =?utf-8?B?T29QZVpiRkRiN09NL3c1RVpGZi93WFpNdnNOSkVvU1FGbTFQTDgwM1E5R0Ir?=
 =?utf-8?B?UXNOTlN5eUo1RHVOOEp2NUZyU0I4Q0NYd0t4YWJmaVdNWGtNQkUvRmZXNWZZ?=
 =?utf-8?B?Rkkvblk2Ukg5NjMvMGRhNHpTbld4U2VYUm9BandMbnVja2xyWWJycjNXN29z?=
 =?utf-8?B?T0ltb3A4bVhaVmZxKzRiamdTWUNaR1k2TTBvSlNnWmJqUXFESGxEMCtSVHNX?=
 =?utf-8?B?UGk3emRhVHVEQkcwVXVNL2s0Rzg0Z2ZubXdLOThtckxRd1pxQjdRTmJsZk5h?=
 =?utf-8?B?SFltWEs0bTNoRXVZNVFGM05WeWREQ2FDMXBmT1pEZ3lDZGljMkVYaDVZcnBi?=
 =?utf-8?Q?hd3MxZ9HjcvhPiIbYe78bIHaSQVd/asty3t0Nzc?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db83c537-3bed-4912-e9c6-08d8f2ad278a
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 12:21:18.2662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EahnrmMw+BC6T7bakI/IQLjZJ42cSWLGFUUL7syge7VoKIwlonuPl/iHCSRQbp+Y8aXwBFCDVWunXFC/7FE0Ss7haIxSYQHhGIQh/ZUg7Y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6273
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Please ignore this series as I have missed an important audience.

Going to resend another series. My apology.
- Quan

On 29/03/2021 19:09, Quan Nguyen wrote:
> This series add support for the Aspeed specific SSIF BMC driver which
> is to perform in-band IPMI communication with the host in management
> (BMC) side.
> 
> Quan Nguyen (3):
>    i2c: i2c-core-smbus: Expose PEC calculate function for generic use
>    drivers: char: ipmi: Add Aspeed SSIF BMC driver
>    bindings: ipmi: Add binding for Aspeed SSIF BMC driver
> 
>   .../bindings/ipmi/aspeed-ssif-bmc.txt         |  18 +
>   drivers/char/ipmi/Kconfig                     |  22 +
>   drivers/char/ipmi/Makefile                    |   2 +
>   drivers/char/ipmi/ssif_bmc.c                  | 645 ++++++++++++++++++
>   drivers/char/ipmi/ssif_bmc.h                  |  92 +++
>   drivers/char/ipmi/ssif_bmc_aspeed.c           | 132 ++++
>   drivers/i2c/i2c-core-smbus.c                  |  12 +-
>   include/linux/i2c.h                           |   1 +
>   8 files changed, 922 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
>   create mode 100644 drivers/char/ipmi/ssif_bmc.c
>   create mode 100644 drivers/char/ipmi/ssif_bmc.h
>   create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c
> 

