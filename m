Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C237D791962
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 16:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240980AbjIDOGu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 10:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235306AbjIDOGt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 10:06:49 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2084.outbound.protection.outlook.com [40.107.14.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06587C6;
        Mon,  4 Sep 2023 07:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZ086mzdRAaFlDTHF9cth6VyClwLGWAMXh+o7vMM9kzU3+VIf3uZ7+Qn3Nu+9fbRHECS/pYH/l9NdjXom4E9ySOOOizggdgfIaRsPo+LeG3wBhDhp6oir6le3HKh4+84MA6Z8chOBY7wv+1EA7A9Rlc8tZ5qRIu8TGEWtn8tRegCBgDDHtimV1RluInd4z9PZ9d8HgclGT8KBfXuQgaintIgBB3CGlbOe9I043PPmDlA2a5NqP5fghY7Qh+gwFHXRRBJQifNByIu+zz3oTRmx11qxECDoszl4WkY1vN6mchND+vvYh2O10kbH/Nsa1uleY9wAefa1IhNjbFRpDf5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrTlFjHYWGC6XOc752BOJTdW4Jy78MoHUtKhqBfzI2o=;
 b=ZrmGib7WxVGZpuS7YMEcCHkcLPeqH/cgOJf0WBnfc3l7s8YqR7lVLKTSktOxg8n/9wbWHm8ZWj1wm8H8JXZrYbBHS8K135sL63lIFjVlPEvnK/yHXWxddl3xWJNPLQaird1GWQVkCLizwt2oYhpdEXxbQ/sVj9vMlQ3fkIUbEKpNlRkKrT3VudORWoBih815eWdEptzB9tY1T6jw2eVKzOHu9PoOlS3WwQ9w1XvO9X5ZsVCDEnnKXRz0n32f2BbYeAeGNfoHfZwxw/659OT8NewEbBYbo8y0qpk+jq5MOgyuJpLTmt4UbCuN/pxlF7DHM5suq4nxyQrSvmC04VFHfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrTlFjHYWGC6XOc752BOJTdW4Jy78MoHUtKhqBfzI2o=;
 b=mwxGJtiZoQ501L4UFPoxem5GyOTBUZy0Gqmukd8sFt6IMmhLd0r+nit1D118Dcg9nBEwjO2BuvRGvmLx1VxRPAt6bkH1euABcTHBL/Km9khzzFbo+lRSvfVr+fr9WlF94bMqD7LazouYuz+sUlt4HBdpmbqaQ61kFp3tkSEMpMhSG1UFFX8pSvJipdsa66ZQ7KT+XVOP7V59w6Bd5SpMbtekUG+4Cngc2q+F/mIVFgollt8TL6jSFSWNvTgQE+EYrSpm5Z7202Q1BPWqz+q58ElBXH1Iq4De0MnaQB/Acv63A/hTndisd6iEq9qtiVvrfjgrEIXdi83vFomjoIZGMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PR3PR04MB7340.eurprd04.prod.outlook.com (2603:10a6:102:93::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 14:06:41 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::cc91:7bb7:2f06:1cb2]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::cc91:7bb7:2f06:1cb2%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 14:06:41 +0000
Message-ID: <7755c3ee-9d7e-8ae5-1cf7-a5247cc4e6e5@suse.com>
Date:   Mon, 4 Sep 2023 16:06:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v14 1/4] usb: Add support for Intel LJCA device
Content-Language: en-US
To:     "Wu, Wentong" <wentong.wu@intel.com>,
        Oliver Neukum <oneukum@suse.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
Cc:     "Wang, Zhifeng" <zhifeng.wang@intel.com>
References: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
 <1693806261-12958-2-git-send-email-wentong.wu@intel.com>
 <a8c8af1b-9399-6ca9-ea3d-b71e6ee68cad@suse.com>
 <DM6PR11MB43166D27FB15905CB02DBC5B8DE9A@DM6PR11MB4316.namprd11.prod.outlook.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <DM6PR11MB43166D27FB15905CB02DBC5B8DE9A@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::20) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PR3PR04MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ec0902-61b8-42bc-9ce9-08dbad5029e2
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vT3DmR0NLv24QlGpJo8EHOwUs4jGj+SQPWdJAqKayQ3ag/i6xliUqNAJ4fxmbKngzLs5Nd2KJM59wH/3v0qCvNG0S17f2BoHgfhnZAqjHhdUPPZraZVpKKrokgEf+TP8K7ncbMnGWOohMKeryPIEF/FlynDHC0zdD3HWZzQUwm5g8BovyZ/g8cKKNwrNQamiT1Lg2D/9AlE5z6RCrwqKzRrEs9O3KeXgKy6fSKvupze1s0HBaTYvnm7B2yjuP8GZUuCuqKrDSfbKNXiLqtMLMQUf4d4T4c4vHzUTNBAedi45HYXPgdjwJiBea43uVBFkXj+9vh3mMgw0FLSV2hWJ9cpJ/Dx4gBX3sEkEowVT/PDEJ71A+99dbQlv6xVtidCty5eXV5eluBhoBbjo2GUrsqS16jkaG6Zg70kkSwDF06UPidWNfTefOn28f7TzZoVs9nX4eLInk6orj+4dOEGLKtyxL64n/PKBCWQHyyjQTdv+MB+AtD5cEwDNiyCkmcHo3luSNBWr/kz5YfVlPQGlXTex+vFsFQbi4uc0y6OLDJQaaFQGPYINLN3HtdvM8EpWOO1uW/TuMS3PzwtjW7QJG7qi1IqR+oPorUPO6/7Ux6MNxWJ46IGtkxJ4OLOJiBpt8Fv1IReajxqSku5+4SHkLsZTWiJqgFzuSCGCu69+pUI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199024)(186009)(1800799009)(31686004)(86362001)(66476007)(66556008)(66946007)(316002)(110136005)(2906002)(36756003)(31696002)(8936002)(5660300002)(4326008)(8676002)(41300700001)(6512007)(2616005)(38100700002)(83380400001)(4744005)(7416002)(478600001)(921005)(6486002)(6506007)(53546011)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGxzc2VBazBncUhCWFByQlNySEp4bmFzQnFGU2x0K1lLQ05FbXptb3ZKOG5K?=
 =?utf-8?B?K3gxMTRlV3FiSzBRaUZaUkJvemNsZGNoalZtclZsWnlib25vbnRGazJ4ZmlZ?=
 =?utf-8?B?N1psV1R3UU9NUDRGZm9RZUw2RktDbDdac2Erd3dFTUNwYlg5b2J1Y2RIaEt3?=
 =?utf-8?B?OUNXMnZYZXNEcGljVkVvbUdDeEVGZ2g3cDFOcFhYTHYwTVl6QXdhaXJFaE92?=
 =?utf-8?B?NU9wYmJUNEp6c04xVE9nK1pxc2JTYmJuYzhidXFsUm9waUNGWWM3eTRHZWZS?=
 =?utf-8?B?N3BnZEpLcnpxZXgxbzNHUjdsRUhiZVN4Q2J2ZWZ5MHhEOVd0RnR2bWdCWE9S?=
 =?utf-8?B?L20yVnhMTzc1WlpsSTRRcnloSE4xMGlxSDZqYzF1VGVEZDQ1L2o4ZE9NZkxk?=
 =?utf-8?B?L2oxdVVxOENaZlQ2ajhlK2lBN29TdndncS94RkFNc1l2U0xaZktGSjIwK2xp?=
 =?utf-8?B?K2FIT3RodGNCeFFmWTZxM2lxckNzTWQ1QldnUnMwWUE0dnpSN0lUa3E5bEd0?=
 =?utf-8?B?VDJ5bXdvNWlkN1JJR3U0dUNtUFJWTDZFQTQzNWNBNHd4b0xVLy9pem02QXVi?=
 =?utf-8?B?SkN6QWRxWDdBbDYwRWFYS012eGthSng2dEpqdFI5bnlxMklNZ2s3YTR2RXc4?=
 =?utf-8?B?RHpick9sS1crOU0rVjdvOG5wRmM3WHo2M3lRdGZ5S1FwN3luWnVHUXJMS1ZW?=
 =?utf-8?B?YVlqK0wvL3hKN09ZN3lSRGdzSlBCMjMvR01LTXNwM1JFeEI3VWQzbHZMd0FU?=
 =?utf-8?B?TTZzQ2wxMkpzM2xwNkRxb2lFWW1FQ3diaFhxYStoVkFLMEdLelV6SUNpYU5L?=
 =?utf-8?B?S2lkcWJ4aGNNQUVrTWdMOEpoeFVhMFAxSDNvN3daWkdpRWVOTERRMU9QNDF3?=
 =?utf-8?B?Z1pNRWRNcFJFOXh0YU0xbmhkOGN2WW5tQmgvY21TQ2tMS0Z6Sndvd3JWSjNJ?=
 =?utf-8?B?MnBCYnBJYW00aE5BMGRuUUtIUEN6aEcrdDNYK1FudHJyd2wvUGYyUkpzSVhJ?=
 =?utf-8?B?cjN0Y3htVVgwSHVxZXA5ZXN1dFUxUmtvSEhjTE1yMGpLa0pYZitmVjlFTEFE?=
 =?utf-8?B?ZTdJRERXZDhBWGY0bkIxS05wcFhPenNFaVVhaGxBNnpia0JmeUpUOUhVTnVB?=
 =?utf-8?B?Y3YvN2s3bU1MTEp5YnNnamQ4aGVRZFloOVV5T29qQmFTQWJZa0VWV2FsdW9x?=
 =?utf-8?B?Q3dKODcrM2dnQUdDRFhVaW0rc2E0STkzL2tTR3M3bnJ0ME1LNkR5dkNnQmpa?=
 =?utf-8?B?emVtNWFLOTdLb0NoNHRwVDJyT1F5QzlyeHhhNStabjB2K3ZCVXFHRmdVVFhi?=
 =?utf-8?B?T1UrbTJvZUYxb3ltN2FOUDNmZ280cXdNVVN5SnJhZ3A2allvRVFGdnZQSXUz?=
 =?utf-8?B?anhHbEFhV3RKbzRDVy9YSzZ1UnlxU0hybitXVTBHM1BMTGtLTFN2cWNpTHNx?=
 =?utf-8?B?TXhUb29QQjUwWE5HeWZiR1ZWaUlTTDNJekoyazNDbmtGeWNHUDRZWERYc2FT?=
 =?utf-8?B?a0NoUEE2UDNYTys5K3RtSjVrUkNLcjczV001ZlFJMnFVaTVBWW9ZZ1JkZHRm?=
 =?utf-8?B?VlUvYjVZcVN0OG1JWWJoL2NzWmNsL08rYzRCeWdTdkM3RWxZZjgxbHdNNGIv?=
 =?utf-8?B?MzhtOHNTMHBUaVY3b1ZRTStHMG1KbHN2ekEzZ250aDhtamkwQjJTM2NONVIy?=
 =?utf-8?B?UFg5NUxkbjhZa1JFaEl2V1pqR3lyMm9wNU1Oc0ROdkRXUE0xak51K0l2Nm53?=
 =?utf-8?B?SWczZ2R6SUtOS3hKZ051ZURMbzQvMnpaeXBjU2Z2Y2dETHE1SlpmY29SY055?=
 =?utf-8?B?K1dwV1p5L1d3eG9Ma2xJTU9TdmIwRVRpek51eUtJMWw0VWpwcVk1TTFuZElQ?=
 =?utf-8?B?MmUwdlpVYjdxVXV0NDFsLy80WnlFblY0MDBDdUUxejVmSGp2RS8zSHV6MXJ0?=
 =?utf-8?B?NlFOejFtL2RLRlZSSUMvYzl2YUIwMEFZa1ExdFhIYTBBbDBFZDZOK09wZTlZ?=
 =?utf-8?B?RDFUT2pSYmEwZWxqbHVPQTB2eVA3ckJzN0lVZW8zOCt0cGxubER0TTNCY0g2?=
 =?utf-8?B?T1hIYlRZTFhETmtNcTNUWmpIWlc4eVNDVndROUNUME95aHZaU1BDeFpCaHVi?=
 =?utf-8?B?dTByYXFSWFM1UndxL3RTOVNoZ2kwUXErTm5PWjg4K1A1ZEZieDlsWE1qbmZJ?=
 =?utf-8?Q?Wk7aAxf1Bg+TPsW/27OndKcSlUF0wVZzMqD1varzXJic?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ec0902-61b8-42bc-9ce9-08dbad5029e2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 14:06:41.6345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Yaq0nM6gLJpXomv1lfINb0f8dP4EY+qVwpAFyp3ZdFzU1syi4YHcgcGAHLiCPEgwTDe9dZbSVhqGSX7R5VIQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7340
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 04.09.23 15:52, Wu, Wentong wrote:
>> From: Oliver Neukum <oneukum@suse.com>

>> And we execute this. rx_urb is killed and does nothing.
>> I see nothing that terminates the waiting if you hit the wrong window.
> 
> I think the auxiliary_device_delete will trigger the remove function of ljca
> client in his own sub system, and the delete() or remove() of every subsystem
> will not return until the ongoing transfer(probably blocked by above
> cmd_completion) complete. And that also makes sure no more transfers
> comes to there.

Sure, you will not free used memory. But what allows you to be sure that you
make any progress at all? That is that you will hang arbitrarily long in
disconnect?

	Regards
		Oliver

