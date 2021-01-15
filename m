Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1FA52F757A
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jan 2021 10:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728941AbhAOJbG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Jan 2021 04:31:06 -0500
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com ([40.107.21.135]:60512
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728794AbhAOJbC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 Jan 2021 04:31:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpwHK7i0bbHhl6i+tUXUO1ydbs0jd8wMO5PTunq9f2BwtEBpFdCWPxlvem/1m3E0muIKP8NOR1tUgTa3hDiv1o44MwW9JhiOnbQ30eBzfmIRMylh1fVMEbwnvjB7YHT90FzXs6mkynSbQ0qocl1YtOM52coFTZHLneCrMnOtVhwfUTkB0gcBifdgEPxdIkhpshOrUgGnNwAOvgA9ow31Z5o92nArTDqGOVEqtm7IlTFtMcfTuXuxsAViCqiNHkdvvdErQanZ1K6NftbOY9sZBnq/E8XsB87JM5TvL452Y3i4/zVI0cpb5T4EuK8Hia/PlshiUkR+NFZhEzw0owJrLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgOKsY+cKPayRAsBccBp8TDxAIE0fIIxihKph9eKeLw=;
 b=hjqgZ7VCZdPSrsOpBsOdz6jaIt1I4xvaqbyIVCCJ/0hMnFyP8vqv8ChVjOPr9Q9XnOz8hqFQi8lJgAtBpvyzB4Gk3NwInY58qe1ggA50fBdp7ie5e43JWc8OcCgBDjyAPdBdr31Xwcet6Z0PZGzNh9PNNhI/VWlFG4n+vw1gxORl+Q3HKpma9mT7JvOI6KKvnVVkQkEAM9tbjawNvhX9oyOtQNP5PdYMZ/WdyYle04+kX8kwlj5QxbnLPlgnmU0XXbHPtJmpjtQC3faiaFUldX3i/bFRqxyE1GsHHpdDgDkpxd2zppIGODZ9+EuRmOx0Wn20huESe9i+oqUeIuXqDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgOKsY+cKPayRAsBccBp8TDxAIE0fIIxihKph9eKeLw=;
 b=VoGAldloRRLXjQlAMUfXm1JUhhWtC1vvfdAgC5n0u3HNF+o5tbd0xByG7SbpwYbF3lOGkVc2K1+4bOKuFkCXyNkBMDjUptKVh/Xe4yjWeyfnZcJtf/BgcabNfXzEzo3gkffvO2gApqUXadcCmx1xeF+szn57jw+kdgz0AK5wSrk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5963.eurprd02.prod.outlook.com (2603:10a6:10:fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Fri, 15 Jan
 2021 09:30:08 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3742.012; Fri, 15 Jan 2021
 09:30:08 +0000
Subject: Re: [RESEND PATCH v3 1/2] i2c: i2c-mux-gpio: Factor out pdev->dev in
 _probe_dt()
To:     Evan Green <evgreen@chromium.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201118234025.376412-1-evgreen@chromium.org>
 <20201118153951.RESEND.v3.1.Ia45846771c63de3f2418d2b9c767cd95938a164c@changeid>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <e1fe3965-fcf3-babd-b1bd-498bd5aee981@axentia.se>
Date:   Fri, 15 Jan 2021 10:30:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20201118153951.RESEND.v3.1.Ia45846771c63de3f2418d2b9c767cd95938a164c@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR05CA0373.eurprd05.prod.outlook.com
 (2603:10a6:7:94::32) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR05CA0373.eurprd05.prod.outlook.com (2603:10a6:7:94::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 09:30:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60f9935f-ddfd-482b-cda4-08d8b93825f1
X-MS-TrafficTypeDiagnostic: DB8PR02MB5963:
X-Microsoft-Antispam-PRVS: <DB8PR02MB5963D4692C5E8C9A89199744BCA70@DB8PR02MB5963.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QjAlIYniPQtNDapPX/BFuTZTv3qoYxquzYSdhkLLW36uNkyjxZCGsvh2AmgEoXvVq9XKoo5BtuKxVsmswuVKwH0t+I6pYd7r6v633vL6WCEdPlBAGqoJseN9AXeCpT8ADkkgUj+rgNK+BzRsyA+CLcB/yE6UlsPAaIthfOChaQRpM8ToTS14sBjv1oxDyoUDH2zgrkG7TDHKBveokZkcBMaUUcAMooKu0j6V8SEe2r+Wu/AyE4K5OmRrtvpYCISxOjVry0EO3oGGeBKeP40HLQr/QAVfLEFdUaUX+1hIuMxxe0EYmJ2xHApjk5M9/tc5QQbk2aIjqWg5DzQ+2AFczczbRso2uK1GRPnhbW7jf8MRxRb6lzGgfzlXXXCl1i7GHYDBkqDjJa84omkokQT6XRDorNYTjdichke9gqXirPJq3ya2ME4toF1ObciWV5EfNUGlLibub2QhMFBm12PPKBP+fFK0P+kKAd4U4vZFSldAsDPBAcE4epT8a+lwAguQ3YaksB6PhoSWJJTV2f2f1OBsH4zJ3OOu6HdJaExjcG3p2+fLAQ8vyrxWg+R7TwI/UbOnMrjqQU1EcE47LNNO4U8666I4HISPq/WGsC0QBCo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(396003)(366004)(39830400003)(956004)(54906003)(86362001)(8936002)(16576012)(316002)(2616005)(4326008)(6486002)(16526019)(4001150100001)(5660300002)(66946007)(31686004)(36756003)(66476007)(36916002)(2906002)(66556008)(8676002)(31696002)(186003)(53546011)(478600001)(6916009)(83380400001)(26005)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q3hpZkZuVDF0OVhWa0ZBSmZSc0NQTmpvcnJmTmVnNkF6a3JUV3l4Tm5rdXJt?=
 =?utf-8?B?QVRFVGhROWFIQnl2TXNST29FeDNyVlh1RUI3VUd4OWZCeEJPWjRQdUJOSWFY?=
 =?utf-8?B?TlNDYVVHMTEveGZpa1BEczN3N2FLdHlFM01YcGR1T0dKc21oK1llSzBhcHQv?=
 =?utf-8?B?VlhxVzg5NWNucEhHZTFIRWlPb2d0SS9SQTU3V2hGM3BDc0ZpZlFlUS95Qk44?=
 =?utf-8?B?dFlVazZVeHZjMllQaWlIRmM4Yk14anZUbGlBbVJuZkwxdUhzYzdDMEI0U1lY?=
 =?utf-8?B?RjRManF6enJsU1BKYlViWWxmajc2SXVPTEdsUytOeGhrbUNyUlArRDNTbXBq?=
 =?utf-8?B?Z0tiNVc4UXJJcUZhS091c1V4TS8xSGN6blF3S0VxYUlXaEhrOVE1bFl3dHNN?=
 =?utf-8?B?THFMRzUyTDVxWGtQSkpQQlNvRzl5dFd6WFM5a2I2NjNOUjFycHVNTEppQVBZ?=
 =?utf-8?B?RE1HSGNVOHBxQ1VUVGNZeHdQUUR1S2l4M0hjZnM5d3plRkJVdlVoL2NvVWdT?=
 =?utf-8?B?cnhBRzh5UlZ4TThLQzM4MmlsM3FvWk0vQzdyQ3lRTVJqZzQzYytsRTlTN2ZU?=
 =?utf-8?B?WStXQkEvWGE2and0T3hqL05NMkplT1RhT2FVWmw0SmhvWWNHeVlxQURxT200?=
 =?utf-8?B?UGpKaXVkcXNLTVhWZmlZNVFMTXpkY0dIeG40NXFKajF0L05QMnlyeCs2ekRI?=
 =?utf-8?B?cDBkL3p5ZnFYN0VzNTFtWXFlRkxiclRwM0Vtdy93dVNiM094MWZXNWlGamJp?=
 =?utf-8?B?S2JRRUpGOFdpTWtUWVZuTDJodm9PS2wwR1JsdDczMDdmMm8vS3FlWHpZdTZQ?=
 =?utf-8?B?Y1g2ZENzQ2hscHhHQXY2Zll3ZGpsSmtBcDNITk9pa1I2bEpxaXVDdUVIaHBB?=
 =?utf-8?B?UkJza3hYelJYVDBORUd0dlh0VEY3K3oxZWlHRVlXOGl5aEF5eXQzY01Pc2JT?=
 =?utf-8?B?UWR1QlBJWkxWcTdiV290N0FDbGxnS0dHb0xTNThDc0QrYVFES2VHWjBwTTFv?=
 =?utf-8?B?MVFDK1BlbWpIZU5ic1luMWVubHlVRFVvNFRWRmhWc0RnNlQvVytwV1Z4bGJr?=
 =?utf-8?B?Z1hDWk1CWFhONVRMUlFERUN6bVlQek83R3hBUW1QeWpRb1VSdHM2VW9wWDJ5?=
 =?utf-8?B?MThMc1Bhb3F4K0FQT1hvQU5RSVpUcGlSejlYSmF2ZDJ2bTRzOWJJT0FQbUJp?=
 =?utf-8?B?YXIxdEFJamV6cUdaTUpzeWVmN0ZnK3M3LzEyVStNT1FvTjFqZ0FyWjR0ai9y?=
 =?utf-8?B?MzY0c0lMVjV2NnpRdk1ONjRqU0VCSVpWZUhEWmh4Q3hjYXg0TDhIdkIzRHMr?=
 =?utf-8?Q?LI86egXp81yv1P8RPXl1ncHEIohbH1Ih1K?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f9935f-ddfd-482b-cda4-08d8b93825f1
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 09:30:08.0315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yk2OlvOOkjl+D+p9NnASQ/MVHnojEVBoFE9OAlGK8QgPTVCaHVj0zNwKjHP6k+E5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5963
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-11-19 00:40, Evan Green wrote:
> Factor out &pdev->dev into a local variable in preparation for
> the ACPI enablement of this function, which will utilize the variable
> more.
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
> 
> Changes in v3:
>  - Introduced minor &pdev->dev to dev refactor (Peter)
> 
>  drivers/i2c/muxes/i2c-mux-gpio.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Peter Rosin <peda@axentia.se>

(this patch doesn't make much sense without 2/2)

Cheers,
Peter
