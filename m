Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 961B27CF3FC
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Oct 2023 11:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbjJSJZs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Oct 2023 05:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbjJSJZq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Oct 2023 05:25:46 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2115.outbound.protection.outlook.com [40.107.8.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B9EFE;
        Thu, 19 Oct 2023 02:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ficOR7UBTcJiOXhTalmFM5mKeeP0bPKWPE1/VXd3Qjd2mhuOIqqPoNjiWOQHrepXDFD6DmBFfDCjvTYD3X2kkHdL3id9tP3QLn7h9qrl7F/AF9lL8SHndGRNVOl+YxPTJoXOY3cLO1wp1kZIw3orsR+rBB/iztj3McAxTBZZmQm9ULquWkSeWBnq/heLnmUB0Cp3DJYLzwSYPVrP+ZlZSUh8INjubDTXdJxpGBHJkdOx3AqthHgXXXGTew0avc6vQGvjy3vXe4JQ8ioXJFqRbk+yFgxIzoryrAN9qw0E9bpWwGHGwBwg4tqNbKDBm2QNeF7e4M2F8SUqMxIdPeFV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asB4tzUpKzqKBFN1RGZWEgc3j5W45Wny5I2G7zEGKUg=;
 b=E8qiVebErt3Rv9KzhuBYfAMcTJcuJ4da16o8h5VQnyO83DWpn1o3KCLrdZjivfIVYmje7EdsJgSamLHKhGX8EqZuGAhdjk8t09+KlCuJJacB8xNUuC2kRDzhq63TQo+sUyULUeebXHO/y2c3cT5lNTn3lvVW3mKFK8fTYVbaMbIjViCTTiJWEhUQ3mkyHcn3XVAzlDmjmgOD183CQeB10q/+UNc132qhLUs+z8m6rF7jiceFxIk7oX/MbGiCwhNPkj+5YtQN44iUtKHTtRf5etBoa3x/x/DYR8SMVrrHdbetF5jKUiuKYZxnqzghtHrtsDDU3anIk3wu7gbXmroGKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asB4tzUpKzqKBFN1RGZWEgc3j5W45Wny5I2G7zEGKUg=;
 b=D5wL0YEzj7j4DCnfjAge0OG+1xY/D//teDoeeC3m5fdHPpwmAS7A2ujJmGn4K7SnoWTu9B8Gw/3jIrpqjRwo0FFc+iVOSrun91SG8wjjxXa341TVt/NIpWbKIXDSat19Kb+jkG9/pfkSWBmzWzN3776oVWQoEhOdMtKLSdW/v1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by GV1PR02MB10862.eurprd02.prod.outlook.com (2603:10a6:150:161::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Thu, 19 Oct
 2023 09:25:37 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d%7]) with mapi id 15.20.6907.021; Thu, 19 Oct 2023
 09:25:36 +0000
Message-ID: <668b7c50-bcd7-b99e-3438-eceff6594dd7@axentia.se>
Date:   Thu, 19 Oct 2023 11:25:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] i2c: muxes: i2c-mux-pinctrl: Use
 of_get_i2c_adapter_by_node()
Content-Language: sv-SE
To:     Herve Codina <herve.codina@bootlin.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231019073533.386563-1-herve.codina@bootlin.com>
 <20231019073533.386563-2-herve.codina@bootlin.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20231019073533.386563-2-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0089.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::32) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|GV1PR02MB10862:EE_
X-MS-Office365-Filtering-Correlation-Id: f04f50ed-8281-4659-0a6d-08dbd0855a45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a2PWofWcOxKsgUa/82fI0cvEqJNTpi6F6pVx65Tlyhxi4NOHTstRfVXWQxwzM7MxBlGCOZqkDtX3S7j8vH3tnSgqqeULKhCSc1jsSRnZrr92WTZ5edgrvtpkiyijHfxFK5RMrekBB9H/kiProXB91uLbOS3LdUHOsDRmQK7jm1XQukU88T0orFZyRmlp6fmwDpvKyLsebyBdKIazFLme+sVUYJYSPqEDU+lWGBcNCWMPVBbTvVzGrotXxP1p2Sabc6ztpPqg0D8XStLlVZQJF4yQvWEDs2+7c+ypNFckMjmaI6rEMtKwI49pBjjWbVEE8r0Q8uLWseN4RLuWP/MPV9z0RI19x28UADPsZG0dU49cXYqGx7rK0hpr3TPxlsq1bGz8FjlXzh0C8uZ7kZdWI8ziNRevmtHjIZPz8RIJ+qYHrFf6GDh+2iJBkl0d7ZK4xwtJKSMkimA+GJcLiO44xcN8tTYBaM/gdKS3kKq+W5drw6dxciOQJq9afb22F921kPUewayEy1m9Jr1uxcoUoC/BDMPAfGLi/JCel0cwHxgJ905adFZTMS076PMcKSbhZq3/VVNB67QGmCbWG4cbQsawYpFv+2nqh7Ui03u70F+2zP3SYTVZhaRU0M9e5cdYe8J7i1DSa7ET1Akbs6rFTjyD9EllpM6Q0D3L6uih0lDc/e/U4NdY/UdYk9Z8oaVV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(396003)(346002)(376002)(136003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(31686004)(4326008)(8676002)(4001150100001)(2906002)(36756003)(26005)(41300700001)(5660300002)(2616005)(38100700002)(31696002)(86362001)(66556008)(6512007)(83380400001)(316002)(110136005)(66476007)(6506007)(66946007)(54906003)(8936002)(6486002)(478600001)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFJPV1FVWnk3RjdUZFZjdFR1R2JIeHIvZXJlU1pYcFNpWitkWEtiNHVObUNv?=
 =?utf-8?B?N01kSk5YNG0xWXo1RnBOMDZMWkRUL09OM3pwU05IR2RWdjVBN3NEemQxc0Q1?=
 =?utf-8?B?cWhmSStVeDJmZEJGejJxZk5ZUkJ5a3VwRko4U0Z0Qmd1Zmt2YmZ0OHZZT2E5?=
 =?utf-8?B?R2ZVQ3BhMmJSb2U5VmFkeDl2cHFLNVhYbGJVWnBDSGs3S0lFWXBPWG9JcVdX?=
 =?utf-8?B?SkxwVG9IdU9TQ0tYRmN0eXMzVXk0OXVHcXlrQUhmSnBXa3lsckx1T21qUU82?=
 =?utf-8?B?d2FpTHdQRTJ5cWtZYUozWWY0RGZpUk4xRndyK3NlYW1CMXZBbVYzMTRReTJB?=
 =?utf-8?B?cWRMUDlORHg5VzhRciszQWNMUi8zeHBVTzk5MEszZEZQaEdEc1NKQXd3TE9q?=
 =?utf-8?B?b2VuTSs1RnRlWjNINHhzZngyeU5nVDQ2SmcyMjNqTmZKYThpVUZCZW0weFZI?=
 =?utf-8?B?a21VZE1BMVpxMk5RNnhwNFpYUFhyc3hKa0tvQUpRRWlZb1FGTysxbmZGYmdr?=
 =?utf-8?B?MEtucFhuVVZUWFBkbWdpZWRHemdiNzNydkRFbUt4VjJ0V2tzN2NQaUZzSnlQ?=
 =?utf-8?B?OTB6MDcrNTVOSlR5MlQzL2k0bTdsVk9IMmFvUmE5S3dDdmxKakxTVkZhTHpE?=
 =?utf-8?B?WVVqMDNIY1BGUEl3VVNwRmFjbXI1UDVSbk5uN3ZMWlNuYWhJQ3FnKy9NdWJ2?=
 =?utf-8?B?a2E2WlprR1RaZHd5WU50WWJXSWRFRUtDd01aYnluQzh6SUZEUTRKbU14bHBy?=
 =?utf-8?B?eEN0My9ndlZtNW82SUFDU0tvcVNBSDIxZjdKajZoZDR6enlINWUvL3BhakNW?=
 =?utf-8?B?amtoUmduQThrUy9mK2p4ZmpDT2dUT3NQKzNTZ2doNzFUNlhoQVNyTHBNQnd2?=
 =?utf-8?B?RFBUaVpKL0wyYVk1aXMyVE5UaEFhU2RzaURMbi9acVFUUTVtVklrV0ZGV3dh?=
 =?utf-8?B?ZW1MS0pQd1JwdmZpZ2tjZ0JTRnVLV1dJc1ZMWk5rbTRrYityQnZ4ZGk4NVdF?=
 =?utf-8?B?WHJ4TER0WHpCMXBIMW94Nkk0Q21CTjhtbVhhbDVtSjdJd1NZQytrbVJDZkdJ?=
 =?utf-8?B?Vjh4QTZvenVXNjhnc2gxU056dytjSzJFeEZ4K3NVV2tZZFVyQmwvaTNpVHJE?=
 =?utf-8?B?bndWbjFkVjRWdms4a2QwQ1Y1T012TWF2TGthM0RNd1c3d0QxMEdSaDR5bk9J?=
 =?utf-8?B?cVNLWVUxZDNwbkFsMmZZOVFFSHdyRG9mdm9PM2tXTlVVNWprRlhmZC9uZSs0?=
 =?utf-8?B?U2QzWm1aYnBTbWZSQlJNYUVvNEw0RytLSEhVZ2dWQXorRWZtaGplUlRJdHJ0?=
 =?utf-8?B?TjRZdVJWR1VWMmU2TXBIOTI0U1k5aHUzZFZtZmtpVTZhTVJBZkRiOFYzNjBK?=
 =?utf-8?B?VXdXSGhXUmRvUTQxTVFIZmhMNDNHcU5JWjNYcC9wR2lqc09YbzE0TTNIb1B1?=
 =?utf-8?B?NTh4RWhRTFZXMDd5L01Fc1dwZ2xqSHNneGhqZ20vTDNtSFI1MDM3TVRFcFVo?=
 =?utf-8?B?VXhnK2RqYmVKa3NkS1ZmY3FYcGtTRWFHVWViZWdsUWZ2QWM2U2ZCSmNTWXpk?=
 =?utf-8?B?SVo1NmVmN2JNZHBhVE1PQm93TU0vSlJYWlpUTGNWT0VMSkFyN1hUdE9hNUNo?=
 =?utf-8?B?WTNCM2hvSEtGbitaUEF5bmlLRUFad0NVRzE3bUd2ZEdWaHhWbTZJVDdIV1lx?=
 =?utf-8?B?S2NlYVJTT0RBWGNIc0FRMGVRdEZDVjd4Z2RmZWtrY1hUVzZwS0tTR2xBTVd4?=
 =?utf-8?B?cUR3UjdmNHRDZUtMOFkxVUFuK2d2Y2VpRlRsMlFrSy9TMUJaWUFmQm8wVVpK?=
 =?utf-8?B?RnFTOEFRMEJQSjB6RkpSSlJjb1VQbGR2M3BONUlzTVovaWlVcmI3ZG9GdVdv?=
 =?utf-8?B?YVI5anZJZVhIdDBNWCtiMmpjZjVoaWJ1VGxCd2JiTTcxTkorVDhqTkNPSGtp?=
 =?utf-8?B?eGNnWXl3MytOcytCSjQ5Sm9HVVJRSXpFZ3B0UU1kZWNteXFvNFRCTDlJZGlh?=
 =?utf-8?B?OW5uY3RIeU1GRHdJY0tnSEhUL0xGanBNWlhDUmVVZG8vU0ZuUzV3UGN6SFor?=
 =?utf-8?B?Ym1YdGxHS0c4U1N4STU5OG1sODhTNDBIdWZJNG1PYy9wQVJFYWpVL2VmUUNh?=
 =?utf-8?Q?XiiPml2oWBXcJ/qnCmWncb7EW?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f04f50ed-8281-4659-0a6d-08dbd0855a45
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:25:36.8759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTenXgC+j/Lm8P2y/zF0FK5kj3s1ihgUXaEVxTkUik0FHqe4GegfNHU4MjWc7PNc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10862
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-10-19 at 09:35, Herve Codina wrote:
> i2c-mux-pinctrl uses the pair of_find_i2c_adapter_by_node() /
> i2c_put_adapter(). These pair alone is not correct to properly lock the
> I2C parent adapter.
> 
> Indeed, i2c_put_adapter() decrements the module refcount while
> of_find_i2c_adapter_by_node() does not increment it. This leads to an
> overflow over zero of the parent adapter user counter.

Perhaps "... underflow of the parent module refcount."?

> 
> Use the dedicated function, of_get_i2c_adapter_by_node(), to handle
> correctly the module refcount.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Good find, and sorry about that!

Fixes: c4aee3e1b0de ("i2c: mux: pinctrl: remove platform_data")
Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

> ---
>  drivers/i2c/muxes/i2c-mux-pinctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pinctrl.c b/drivers/i2c/muxes/i2c-mux-pinctrl.c
> index 18236b9fa14a..6ebca7bfd8a2 100644
> --- a/drivers/i2c/muxes/i2c-mux-pinctrl.c
> +++ b/drivers/i2c/muxes/i2c-mux-pinctrl.c
> @@ -62,7 +62,7 @@ static struct i2c_adapter *i2c_mux_pinctrl_parent_adapter(struct device *dev)
>  		dev_err(dev, "Cannot parse i2c-parent\n");
>  		return ERR_PTR(-ENODEV);
>  	}
> -	parent = of_find_i2c_adapter_by_node(parent_np);
> +	parent = of_get_i2c_adapter_by_node(parent_np);
>  	of_node_put(parent_np);
>  	if (!parent)
>  		return ERR_PTR(-EPROBE_DEFER);
