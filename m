Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 231626DF438
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Apr 2023 13:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjDLLvU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Apr 2023 07:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbjDLLvJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Apr 2023 07:51:09 -0400
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com (mail-zr0che01on2055.outbound.protection.outlook.com [40.107.24.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6746A47;
        Wed, 12 Apr 2023 04:51:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCd1oSHRDtj+UDOjz1LCnHOtFB9KThMEb/8an+mOtLdsfIrMoInBVwryKr9SNz0vFxRGqewLK/4oW43gmK2ey4rfp6gAS/DRYwdlL+N3alB5HXCKtJK+hPT66ZhpW6K9Hgy+U/roDZGTgWC8P6/kvRNF3koU1m5zosonAc2Pj0lsUXMMul+ZpdzIL2kHjhVCiqbQG22i2unYji4PQfhprXZ1RUa6sJ59yRIOJTWUQ31a7aaqrebtVK6qv+dVj/l8DgtKKyJMCe7HlPQ+P3APka05rJvq2qMAfsKGdYc+vhWSiQRhMkaxwZEGXf+cHO0JY/mO2Dq2LEA5Vw+fsaNgEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7aCUS15GL/vzp32NJexNCqYfUsTc3XSXWvl61rQY/A=;
 b=h5rGS2DwS5GiHwwBU8u6AgYhYgUUa7xW4WMsOGZZ2AoEeFriFZpYpEL5mmgnBMYooxD6jhN9UX1JTwJV3a6Utkq8nECUmi62ibdeS3/l1JotFPt2dS2dcaIKz2/cSfVIG3/zAPgn0faS/hPW2V1spEW7Cby5wO1/Za2jcQ5lHU7RVZEyI1P4sd/03tNknaCAAnGhUyDecW7N3Fs5q79mrHbffVjNuY5IJGGeQpBp4KifyZ3TEOa4fn2i2qSYVcT7wC4wvniLmB04fAvG9jpKcI32nSIXdHx7XyaVktMgiASs2uGzP1ejsrB9jOyQHOjY4htnqOszpXTlLgl26xW60g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cern.ch; dmarc=pass action=none header.from=cern.ch; dkim=pass
 header.d=cern.ch; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7aCUS15GL/vzp32NJexNCqYfUsTc3XSXWvl61rQY/A=;
 b=TWSy/ztMXvW3T6JIcAM2ZW7RdAX2+GpyPyz89MiAZuqmnESlc6S1ocASPMe9ryZxR0qV6C8YIxbsKZasdt485IbmkH2VZx5rZ3os5lAZgUIPl2+zOe6ppEUtbKUNpPm/uSKXm85lFfWFNTg06NAYCgI+Oagno50pCHMSXxncYXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZRAP278MB0062.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:11::10)
 by GV0P278MB0832.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:53::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 11:50:58 +0000
Received: from ZRAP278MB0062.CHEP278.PROD.OUTLOOK.COM
 ([fe80::cc5a:c993:34bf:e82a]) by ZRAP278MB0062.CHEP278.PROD.OUTLOOK.COM
 ([fe80::cc5a:c993:34bf:e82a%5]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 11:50:58 +0000
Date:   Wed, 12 Apr 2023 13:50:56 +0200
From:   Federico Vaga <federico.vaga@cern.ch>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>, Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux@ew.tq-group.com" <linux@ew.tq-group.com>
Subject: Re: [PATCH] i2c: ocores: generate stop condition after timeout in
 polling mode
Message-ID: <artrsshhaqyaup5ccpu6fett4vjz7bsmiyczakhvyspm35wn24@j54grklavlay>
References: <20230220161628.463620-1-matthias.schiffer@ew.tq-group.com>
 <a937f0c71497b41dc6b7ceb30dc6fdbbed856714.camel@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a937f0c71497b41dc6b7ceb30dc6fdbbed856714.camel@ew.tq-group.com>
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To ZRAP278MB0062.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:11::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0062:EE_|GV0P278MB0832:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c1765a-162a-41d7-9799-08db3b4c2e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iaVP8XPmLGdbcyH16CbWkeZ1B3F52sheFL5oKg32vyZeDVE8A2Un8mAdnHjl/vX7UtLnXvTMjVi50OKBmGrTsHXeJDBkTCjVPQnRT3F0cUFCWGe1w2FLnffhH/hCmPD86vxArXGkx8K2/9Rin7yID9dRybw1XM+V/pskPrJe40ZdfMOPBaKTd6fbX5JPnFqNIgH3bafjkSSEW6MFl/2QVm2kQTT55NRghJBKJSBHnZ9ufXUbvahmKAoRCgOHXBam/1mFR/magfNPOFwylzEOSoVhsWcMewOXaWa2O+4kyvLHiPJ9JhMbP+eUctw8ISD/XM+sYw8Q3L2EHpbyM1i/yOJJPLAIsboJOXwk6lduxNjn/f49HTro8UVx4VfITCBI8bwoBw0xZlP6HmSJYvTh6j5Hq1BohEAkcYUHYOL9dRYTovYmATYOhDDKGpjZKYUuNNN4Gf1HiH7EAmU+MzDu2uOSETKqMA1Y3YhVIg/yComUrF04Xr0eZMuEM43WBY0GBQ0oReep1Ux7wn+Ta/69VehyHngx5JijuAB6+H1l2VKHUQwMvNVaParcOBmdqsbJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0062.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199021)(2906002)(41300700001)(5660300002)(8936002)(38100700002)(44832011)(8676002)(41320700001)(33716001)(86362001)(6486002)(6506007)(9686003)(6512007)(54906003)(83380400001)(478600001)(66574015)(186003)(316002)(786003)(66476007)(66556008)(66946007)(6916009)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEx0M3JZbUgxSkpjM240cGZmTUx0WEJkSUEzTGhIT3d0SlBiU05GTllWSXI4?=
 =?utf-8?B?M3dOMmIxR2ZxVlkxbzFlUGt3T3hkSEp4dUZoNGtOT3B2dGFIbjFYckFDTEJs?=
 =?utf-8?B?Z2ZXdlJiTy9lUFVTTWVDU2JRU2U0TFJvdXQwSFh3ZHFoTkVjRmlIbVpCc0VQ?=
 =?utf-8?B?SmJBTVAwaFY4bE1IK05VRlF1ZkVBS0E2alRjbVk5MXJTbGZLYXA4czBwUjNM?=
 =?utf-8?B?WGQvbUxHMXF2RmJycG01cWJBa1ZPMW5EaSttYzZ2OVVEUVJxOXlwOXpxWC9B?=
 =?utf-8?B?VzdnZ1FzVFpJcnNROHN5Q1dLV24yNFlZWTM5NWJGSXhYZTYvQnVsNkU2MEw4?=
 =?utf-8?B?ODcwaVN5N0M3TFFjVndGaHJ3M2lUck40bTIzRWlWSTUwa2FRZDdjbFlPTyth?=
 =?utf-8?B?eXlTZ21ZcUpOSDhOb0IyNFBNVWJEaHE3VDZMYUZ0Qjh5VzJMZ0g2OWFCVnBP?=
 =?utf-8?B?eXRRWnRoazBNc0FjUm5EeHRrb3dWMWdpNzZLVDlrUzUzVzRoNWZ5cXU1aGhS?=
 =?utf-8?B?TGJiUTAybmdReHk3Y0N1dTd6clU2Nmg1TjBUWkpMc3ZXYzlDK3RNUVp1TDJU?=
 =?utf-8?B?R0VEWmJIYmozNVNMZzBkR2EwMkpCOVdXbWZBZmoyM0lzdWxKZndjSUE3NTIx?=
 =?utf-8?B?Y2lCL1FWTE5Db2F3VEVMTGdoL0xtUlFyT3c4b25PRkhLcGFxN3hreHNaOGh0?=
 =?utf-8?B?TW1WWUJjMml5Q0VUemplSE5JUm1JZkt6VFhyclpVSFJDVlRuU2cwTUErRHFZ?=
 =?utf-8?B?MXVNc1ZQNktkVHAvazhHa1BCbjhvZ3Y5VGF4RWhBdlNsRGVpOUhORWtzTExQ?=
 =?utf-8?B?a2hMQkNFQVF4SjZXSmt6Q2o3UkFhcHpDTGpjUWJSUzZuSEJJRG9FQUptM0po?=
 =?utf-8?B?eHdNdWZETThsakVVdkFLSVdkVUthVXdqQ2hWeG1oMEJES2JKTWcyU3ozbk9R?=
 =?utf-8?B?aWl2cHIzNzFJY010UzlScmlpZWRMNUJ2cGRDZ2M5R1BydkZHTnhZaXBJNGdD?=
 =?utf-8?B?QXU2Qlg4NGZIcFd6VjIrK3ByZDhnN3c4cEJqRGV1eFY2WU01cERVOHdVR0lu?=
 =?utf-8?B?aHRMY1ZySE9NUHBzWDA0c2N0bFMvdW9tNkY0VlF1V3ZlNXJ6VjFnUHNrWjZj?=
 =?utf-8?B?Q2tPblo1eUNZWUwvUHJKMEYyZm5mMWNTN2R4aWRTcC9pemFsbCtIUG5SY1lY?=
 =?utf-8?B?eVFJV2xMTDRrZmxjTnpyeWl1U2lxL2hRa2U3b0pBdVorSVd5V1REUzgwQURN?=
 =?utf-8?B?eGdCTVpsRElQR1ZEL0ZuS3g4cHR2bUJuS2o2OEEwOUd1Tkk4OFpaaXJEVEt6?=
 =?utf-8?B?enI4YW4vSFJtU1g2c1MyOWtXUVE5VHNRRnNPVFMreU56R3FCanFjSGRIVith?=
 =?utf-8?B?M2hEdU94V3NuZ1p3Qjh0MVdEWUxEeVpPN2NPWDJYbzRaSjhEZW05OTJGOU5q?=
 =?utf-8?B?MHNlQlRKNW81TTZ1Tmh0OVhEaFdOcGkyYUpsNFVCOWhyTHJsZ2Nob0IzUVFE?=
 =?utf-8?B?emd3clBCcC9RZlNGN1NTYXdkZUhEMHNvZW93N1l4ZHBIMi9CVmtTKzg2enkr?=
 =?utf-8?B?cVBiSlhlZXF1WnRIY056ekU0cDlIRkZqa2hjL3lkTnRadGFvanRqUWQ3Q21E?=
 =?utf-8?B?M0JoZnNPYUxFK2RnOHRzQWxnUXBzVFU4d2x4YzFCODdmbzRjWHJlVTNPZGJR?=
 =?utf-8?B?dEt5Tm8vc2JpRnZZSWFJeHY4QWEzemJkdXAvNmFSZndTWnN2aEVzQVFvc3lO?=
 =?utf-8?B?dnZKNFhhSEVtYlUvcWpJUWlJRkZVRFBEcGROcWpZbGd2Z3FHMXR1RUZEenNY?=
 =?utf-8?B?Wk1OSmNxb3cybmdVc0wwL05PcWpneWdhZE5raWd3clpKcWhrVEE5dncwM0JG?=
 =?utf-8?B?VnVtKytwQytUMXljNDFDMlp5UWk2SzZRd3RVdDQ4VTFFcGdIWlNEUFBWT0J4?=
 =?utf-8?B?bzZkbjcyMk13QUVFSHpsV096S01VTVRZUmFtWWZnODh2RFh0aE5XdDhiL0Z4?=
 =?utf-8?B?WVBmbzhWWExCMlhNRmwvdjNRL1E3b0JLWTc1SEtnM1JLdXlXNXN1Tm01aEM0?=
 =?utf-8?B?K0RVd01BeFNoNHJacVRnKzA2c05GK3RQMkg4VUhMRWVnU0FwblQzZmJuM0RX?=
 =?utf-8?B?dUxRdXJUTGN1N0tabUtLRlBrdEsyS0lqWHN0VS9KVmJsc0p1WEVVVmhrUmY3?=
 =?utf-8?Q?4PAJ0/GwuDaVDRf6Fsdvs8E=3D?=
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c1765a-162a-41d7-9799-08db3b4c2e2b
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0062.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 11:50:58.4136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASyI2RNlXNdYJ4gh9pDwHYN/YUwTqLLDFAcJs/TqmoM5iniu/R+jdz0DStgTQIUmG84D4a5Y0+J1svJmOSvW2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0832
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 12, 2023 at 11:49:32AM +0200, Matthias Schiffer wrote:
>On Mon, 2023-02-20 at 16:17 +0000, Matthias Schiffer wrote:
>> From: Gregor Herburger <gregor.herburger@tq-group.com>
>>
>> In polling mode, no stop condition is generated after a timeout. This
>> causes SCL to remain low and thereby block the bus. If this happens
>> during a transfer it can cause slaves to misinterpret the subsequent
>> transfer and return wrong values.
>>
>> To solve this, pass the ETIMEDOUT error up from ocores_process_polling()
>> instead of setting STATE_ERROR directly. The caller is adjusted to call
>> ocores_process_timeout() on error both in polling and in IRQ mode, which
>> will set STATE_ERROR and generate a stop condition.

I can see and confirm the bug.

The patch seems fine to me, but I do not have the hardware at hand right now for a
real test.

Following a few cosmetic comments.

>> Fixes: 69c8c0c0efa8 ("i2c: ocores: add polling interface")
>> Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
>> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
>
>
>Any chance we can get someone to have a look at this patch?
>
>Regards,
>Matthias
>
>
>
>> ---
>>  drivers/i2c/busses/i2c-ocores.c | 28 +++++++++++++++-------------
>>  1 file changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
>> index a0af027db04c1..28bcda3f7040a 100644
>> --- a/drivers/i2c/busses/i2c-ocores.c
>> +++ b/drivers/i2c/busses/i2c-ocores.c
>> @@ -342,18 +342,18 @@ static int ocores_poll_wait(struct ocores_i2c *i2c)
>>   * ocores_isr(), we just add our polling code around it.
>>   *
>>   * It can run in atomic context
>> + *
>> + * Return: 0 on success, -ETIMEDOUT on timeout
>>   */
>> -static void ocores_process_polling(struct ocores_i2c *i2c)
>> +static int ocores_process_polling(struct ocores_i2c *i2c)
>>  {
>>  	while (1) {
>>  		irqreturn_t ret;
>>  		int err;
>>
>>  		err = ocores_poll_wait(i2c);
>> -		if (err) {
>> -			i2c->state = STATE_ERROR;
>> -			break; /* timeout */
>> -		}
>> +		if (err)
>> +			return err;
>>
>>  		ret = ocores_isr(-1, i2c);
>>  		if (ret == IRQ_NONE)
>> @@ -364,6 +364,8 @@ static void ocores_process_polling(struct ocores_i2c *i2c)
>>  					break;
>>  		}
>>  	}
>> +
>> +	return 0;
>>  }

I would try to have a single return point at the end `return err` and inside the
loop just a break.

>>
>>  static int ocores_xfer_core(struct ocores_i2c *i2c,
>> @@ -387,16 +389,16 @@ static int ocores_xfer_core(struct ocores_i2c *i2c,
>>  	oc_setreg(i2c, OCI2C_DATA, i2c_8bit_addr_from_msg(i2c->msg));
>>  	oc_setreg(i2c, OCI2C_CMD, OCI2C_CMD_START);
>>
>> -	if (polling) {
>> -		ocores_process_polling(i2c);
>> -	} else {
>> +	if (polling)
>> +		ret = ocores_process_polling(i2c);
>> +	else
>>  		ret = wait_event_timeout(i2c->wait,
>>  					 (i2c->state == STATE_ERROR) ||
>> -					 (i2c->state == STATE_DONE), HZ);
>> -		if (ret == 0) {
>> -			ocores_process_timeout(i2c);
>> -			return -ETIMEDOUT;
>> -		}
>> +					 (i2c->state == STATE_DONE), HZ) ?
>> +						0 : -ETIMEDOUT;

For readability, I would avoid the ternary operator here and do the assignement
with an `if` as it was before.

if (ret == 0)
     ret = -ETIMEDOUT;

>> +	if (ret) {
>> +		ocores_process_timeout(i2c);
>> +		return ret;
>>  	}
>>
>>  	return (i2c->state == STATE_DONE) ? num : -EIO;
>
>-- 
>TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
>Amtsgericht München, HRB 105018
>Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
>http://www.tq-group.com/
>

-- 
Federico Vaga - CERN BE-CEM-EDL
