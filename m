Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C83CA5509ED
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Jun 2022 12:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbiFSK76 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Jun 2022 06:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235607AbiFSK7x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Jun 2022 06:59:53 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A34991054D;
        Sun, 19 Jun 2022 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655636391; x=1687172391;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=y386scHvGK6C3Ys/xaM5jBuu1yo+hOQBNhJkJTErvW0=;
  b=CRO1Nbmxd9K45NPlZYDOkKXl5kTzAgU1vro7yUmlxOc1h9mNjAuZ1hlT
   2itnz8EUsn0kuqVCbplTW6R1P7s91N3WsgNqyjBsmZAbbZbYVn6yreTXW
   rPVemqy5g15n64/cRIXYja7F3FPld/L0Mh97myZ2XWgizgzxTUQO+qCGy
   9D+1dib1JCZ9+ShIe+deMpUb/2foLF0NcxIO6Fr1ISmcmyp1uyEQPK9b7
   PHB1dktTQLnBdLYFJN1sVQcekMV9OIs0/KaHkEI4kLJUrjwoQpWvMYZSk
   3/PcX/PP5MHyb7VvXg2w9SGxMHI9F8BjJ3YFYUbAK2ODbWZTEphWUD2Gr
   g==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="178559865"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jun 2022 03:59:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 19 Jun 2022 03:59:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sun, 19 Jun 2022 03:59:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrsYjRb5InD23JOLFuWWO7UYonhUTu355bRRXsxTs/zAFJXqWR4eq/fYN2nEtC+weMzKV1uvlmajoQPJwX8BJyycoAcTxqoQ0tvosNIZQw1Fatdo94Swp3zTLQ9o/wa2r9yIxT5PA16zO7eG/RmyFY/xXLYn8CKUtDw3rCWxx03sQ9DaIy9DULDKxKpyrI7Ltd1It7Q1xBTkC8wXdmhoO7neeDi6j4AZS8ydkjv/wQXVu4oyLfmTZrV/8NcmjJifreO6Af0xu/7uLgCwNCbqmvzZQ++9FaTNg4BcNih9HSPJoZ4XWGkYwh+z+oqon8k+kGVhxdooseHZNv0jeHs3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y386scHvGK6C3Ys/xaM5jBuu1yo+hOQBNhJkJTErvW0=;
 b=Xhp0VVLrr3vldskHPLTI0SFQpIbzRBY1vry0BJ7CoKYSl2zzp1bc8j7bvW3AofwwPYNF/rQzXxdFugsRsjEEJdoWRvP8OL0RMEL8XZ72Ma/Fsi0dU0rRZF7810Jpoy+uIxq5AhdEgAqLx++3PiOLE1fWbELS08GgpMkf9MNPYfRtPVFD7YM46effrvmjyON0E7DgQeKlvQDKlMbucr6NHNIg7y9WQUfBry53F0aOqcNlXJ0AydJjsBE9zDFjRQ8WvvuiIiO23qEJcWt+gzYZLehlkIS2HMc/F+8tu7eLGUqMAgrSE9wQKIB6JLEaSUt6nIirAxuKM6Db/EX2xsBZDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y386scHvGK6C3Ys/xaM5jBuu1yo+hOQBNhJkJTErvW0=;
 b=cEtW8rC+S/7VrHnfwA7HEVR65OIZ8pYCtViRb51sQHwrucF48wEF1ibLd1GSOKBAxDXros2lVkLSY7wSHBFfPpnMqdK1QCjeZfRgnk0WNnAlqW5s5NVAIj9MjiLqjkaQqpdEik3so+zpiE34bYN0yZJxCsxmBfopfJf5pNBTSZk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA0PR11MB4670.namprd11.prod.outlook.com (2603:10b6:806:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Sun, 19 Jun
 2022 10:59:45 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.020; Sun, 19 Jun 2022
 10:59:44 +0000
From:   <Conor.Dooley@microchip.com>
To:     <lijessen2016@gmail.com>, <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <root@LAPTOP-706CEGJT.localdomain>
Subject: Re: [PATCH] Print some info into ring-buffer during loading
Thread-Topic: [PATCH] Print some info into ring-buffer during loading
Thread-Index: AQHYg8uuV+0W0XbN50i/4aJoFEbFQA==
Date:   Sun, 19 Jun 2022 10:59:44 +0000
Message-ID: <9b94e885-be5f-3548-67ed-d79c6e7c22e0@microchip.com>
References: <20220619083207.749-1-root@LAPTOP-706CEGJT.localdomain>
In-Reply-To: <20220619083207.749-1-root@LAPTOP-706CEGJT.localdomain>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2495a179-ce93-4eed-156b-08da51e2d18a
x-ms-traffictypediagnostic: SA0PR11MB4670:EE_
x-microsoft-antispam-prvs: <SA0PR11MB4670F9F1B18D5FA6ADC63F0898B19@SA0PR11MB4670.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +oGQX4i1MeGp5VnTUnAAWx5uUBm7GPHpwZhayd/vEznA8/oGi+naFsyVdaieRBhXlNrrACMvOi7On0c83kYOOBHQ21Htqpb91OHL0X9G9nmj8SGSXAlbOrf0c3eYI411glxqrb8qSORMzmpPNFIH1xdYvIRa3MXFJCcGj0W1rRen+Y1zWaR8HvFGrUVnwbB6SiYHKJnuje4LgOhHXOmx5nD7OVPhNKD+nP2lxinz7E92WSPEfd+zFLpHFQ70siVwQBj19eOD/0YthCd6LoPxjzBGT9wu9s/RIFkHY4K4SOXZ6WNGCRDJaW1cPIMX8wxLufaBTLdSjUK4x6gp0bWizkMJBTWs1KgImbxrzN7d6TWYgAKpc66QKlZNy5eoH431MnHRBfiCc2XFISkaGM7TZfNNKrDgbIOlsHrjAQYNJZ8i6o+tENJ4wznHZVmMnzS5CVvj8NAk0jPq/AtYXeCJy6Lhxg3+qU5SIiuneAlhAKQAZFIv3UA8bDd+kfV59G0Vo2qYaAHx3CyAg8DlQ6leZhc6/ILEXmX6wEgemoeJQKGE4hxroJEmIt+btyJkj4u+h03fptxEatls5XsKWopPdfseTFawGnAM8RDOHIs8pfj2O37LCswnCEmL0usN8n3T0BLOXIe33ibZ/z8DfFRHeahqlX4t+PCzckd3q/UxNxt5u0h5VbgVm8hXtPRt1KJ56d5JHL4IgUDVQkOKczMXkR9a9phwRA/M5IPW8r1d5mDTqZcAKjFBPY/Oq7k0aJwIW0xXkUu9QCAMoHOd1tHamu0CqQVwg2iJZsKVzkR4HujpJK78faD4PzZAcWm9YjiWl7skpoCE3HKD4m9lYp18EoE79HfY2ODCwm845e5uG8s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(86362001)(38100700002)(31696002)(53546011)(6506007)(2906002)(38070700005)(66556008)(66446008)(110136005)(36756003)(8676002)(64756008)(66946007)(66476007)(76116006)(91956017)(31686004)(186003)(316002)(4326008)(6486002)(71200400001)(54906003)(498600001)(5660300002)(122000001)(6512007)(966005)(26005)(83380400001)(8936002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGJWek42YnNOS2F5QjhFUlZEL3U4cjF3SEYzNDZSQ0w4SFI3UzZEYkphQ2ZJ?=
 =?utf-8?B?Ym5BVjdhYUFqUEZmaDRDYWhLNW5wczFCSEV3cytPejFwaG40ZWx5MWxyWE9s?=
 =?utf-8?B?enZuK0dpTU1wNE1teUMwL1dlNDB4UUpjZjJybDRmN2lGRkNsbEdpc1E3QTJl?=
 =?utf-8?B?TExEN1I0VVI5aWVpYjlrbEUyR2JDNmpMSVJHaWtYM2txNHg0VmFvTWNKTFVW?=
 =?utf-8?B?Z2ZnMG9hdCtGajNmSUp2dm5veDhGdEJEY3JrYmFQYkF0cFhGYjlqbzRUU1hU?=
 =?utf-8?B?UkxxZzFZQlFscEc1RXFnb01lTXdtaDNEYTlldVNPVGxtdDN6ZkFIajNkMlJ0?=
 =?utf-8?B?YW1uWTJjaU5VdHBUQ25tWGVvSkRjeWQ2WGFOR0tWZTAyUGEwWGdsbkRjbjg4?=
 =?utf-8?B?NzRJNFVndFN5V1NtVFZHVnR4WDY0VUs5NkErcjU3dVlmVDdrWjZ2VGhxTUJK?=
 =?utf-8?B?NjhLd2tDT3p4VDEvdDJ2Q3J1aTdIMlJ2N05kZHdxL1NOeXNwUlBpY0FnWVVY?=
 =?utf-8?B?My96WkdZWGN3R0ZKUGdyRlc1NHhLbWdoSTlKY293WDRValQzVEZweHc5TWZ0?=
 =?utf-8?B?eXgxS3M5ZzZnYU13Y0xpRStBZThNN0lyY1ExTUdtcm9PbTNnYTY2Qmx0Y09t?=
 =?utf-8?B?QXprZHVNWWN0NXM3ZGFpODMzcUlqNlRYS2dhZm1WNU5pSHN0cEQxMEIyMjFl?=
 =?utf-8?B?Z093R3Q3QTBVajZ5VVBXZFRpZlRnamEzd2t0dGt3NXNodTJuT1FHQWIyTVdT?=
 =?utf-8?B?cURYd0l6OFNUNFRLSmd3N3RyWDFjRkZ3ellBd0VtZXAydmhZMWFyOCtRQXlW?=
 =?utf-8?B?R3pKdTd0SC9IRTY4Zjg0WSs4NncwanhETXBFdXBMaVI5dTM0U21TeXltaWw1?=
 =?utf-8?B?akpWWnFWTTVkUWZmd1kzSEhYWnp1MUpTcG1peXp4V043N1RQK2RlT1ovbUlu?=
 =?utf-8?B?SVcwOEVURTg2MzI4ZVVrYmtyUFA3Z3BxNXlndlBNQnRCZjBmSDJsN3RFbFNz?=
 =?utf-8?B?Q05iWUx4TURKakNFdks4eXZWMFJLNURLV1lxNmxYMkRTQkhXaDFvKzJIT01U?=
 =?utf-8?B?dUlUZEVEcU9DSS9yVW9ZY3gyU0cvQW1JZUN6WnZHQmRHTXVna2dFeFlSamZM?=
 =?utf-8?B?ZWxESGg0VklKay8za3hENW1nTVk4VTFwYkNKS3hiMWN1T3pOM0RIVFhOVFc0?=
 =?utf-8?B?TVFxVCtQUzJWVVJlek8rQ1lhRGd2Qk5RSU1OMWlOZGpYdk5SV1JET1cwdmtj?=
 =?utf-8?B?RUxNd2FmTDlFTUd4UCs4ZEx5NkRCbzBYTmtCS3pSckdxRGM4ZnI4OEJBbzVD?=
 =?utf-8?B?QTdEVXVJL3FKTjVRQlpINVBkS3kwQVdUbWxqZjFDbmJIRkVsY0NSSEFpNlZj?=
 =?utf-8?B?UDZUQXplb2hiSGdsWkd6OHREenhQbDhZQmJyM2UrYUtiYWcxVStiRHZxTm5Z?=
 =?utf-8?B?SmQyT0dwMXFRa2Ira2dwSEwyYy8yeG1NMUlQNnVtMFBFWU5LbkcrdW54OUQ1?=
 =?utf-8?B?RkRRNjZwSDhDTXM1TDNJSzZXT2JqZDhneW1YbXB3MW1jZnF5VUE5bzZ1VUpY?=
 =?utf-8?B?VE56cVhIOHoyWitLR3RGbDZNT3c1alVCYmY2bnE1dUxINHk2VzAvSmI4ak1E?=
 =?utf-8?B?cVVrNUdXMUFZZS9JZ0xsVjArdENiYk9Jd0ZiWmhFWVhOVmt2YnVKYVVVRGxG?=
 =?utf-8?B?MjhuKzlvVU90b0RSaTV4czBXQkpEVURtQlI5a2dHY0dLT3NITi9RRTJ0UHBk?=
 =?utf-8?B?TFQ0NW9Oc0MwR1NCNGRaQ2FCeDBWc0ZJQVAzbDNWRVlCdVcwRUQrQXJRSEpu?=
 =?utf-8?B?bXJTcklWOXI1bkRnYmtqczk1WmtmbjFjanNsMHB6aW9CYTBFQjFlK3h3MTEv?=
 =?utf-8?B?aG4xRlVjV21MTGh4Z1JUUyt6a24ycE52Uks3UUlCQ3V0SkFtcjlmNUp0N1dD?=
 =?utf-8?B?T3RmclhJclVkQmF6ZmpKMWZiKzBjU1B6bjRQL3ZsV1lwYXBhM3FFRktIWU9z?=
 =?utf-8?B?RkpIaEpEeXVZaE1hNUg3djlXTzZVbEREYzlQQXF5dFJYS2hObFVuTlJjOTJ5?=
 =?utf-8?B?bnZOVFhJU2tCL2tNbGhqdHlZMkhaRjMzemM5blc4Q3pRbkNCeENVQjlvbE93?=
 =?utf-8?B?R1NkanYyZzd5Tmt0WjhMSXpMR3hCVWpmcDh4RFlEaGpQRUY5UVlmdkZ5YjRW?=
 =?utf-8?B?TnI3TmhQMkFJNFh0dXcwNUFpVHN0R2ZyY2VkYVJjWVBNNG9DUWl0MnNyUGFl?=
 =?utf-8?B?a3hpU2JUSUxDMTFIeWpXU2VySkRpam5PejFhOW1TQ21vWlhXRjlhZW1SWmRk?=
 =?utf-8?B?WVhsQkoxYWR5cE9IT09ydGVLSER6UWwwQ1BDNGE2YW1UQW9kUDBLS3BCbFgz?=
 =?utf-8?Q?h305CqpVzQbnYhm4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A90CB2F30BE5D34FA2D80554C6726152@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2495a179-ce93-4eed-156b-08da51e2d18a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2022 10:59:44.6135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I20S43pRzZ7xzkVkRVjZ0D2GPNNsgbw0TJe3usnwbc+Rel2vR+u6wjnw8ogGu35FW64pcFx77LtnyWL2q8uBDwS6Ljabn38muzeV8HKxO2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4670
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTkvMDYvMjAyMiAwOTozMiwgcm9vdCB3cm90ZToNCj4gLS0tDQoNCkhleSBKZXNzZW4gTGkv
SmFzb24tTGVlLA0KKEkgaG9wZSBvbmUgb2YgdGhvc2UgaXMgeW91ciBuYW1lLCBzb3JyeSBpZiBp
dCBpc24ndCAtIGp1c3QgZmVlbHMgd2VpcmQNCmFkZHJlc3NpbmcgYSB1c2VybmFtZSBsaWtlICJy
b290IiBoYWhhLg0KDQpNYXliZSB5b3UgYWxyZWFkeSBrbm93IHRoaXMsIGJ1dCBhZGRpbmcgcHJf
aW5mbygpcyBpcyBub3QgZ2VuZXJhbGx5IGENCnVzZWZ1bCBjaGFuZ2UuIFlvdSBzaG91bGQgY2hl
Y2sgb3V0IGtlcm5lbCBuZXdiaWVzIFswXSAtIEkgdGhpbmsgdGhleQ0KZGlyZWN0IHBlb3BsZSB0
b3dhcmRzIHN0YXJ0aW5nIGtlcm5lbCBkZXZlbG9wbWVudCBpbiBkcml2ZXJzL3N0YWdpbmcNCndo
ZXJlIHRoZXJlIGlzIGEgbG90IG9mIGxvdyBoYW5naW5nIGZydWl0IGZvciBuZXcgZGV2ZWxvcGVy
cy4NCg0KQWxzbywgaXQgbWlnaHQgYmUgb2YgdXNlIHRvIHlvdSB0byBjaGVjayBvdXQgdGhlIGd1
aWRlbGluZXMgZm9yIHdyaXRpbmcNCmNvbW1pdCBtZXNzYWdlcyBiZWZvcmUgeW91IGdvIGFueSBm
dXJ0aGVyIFsxXS4NCg0KSG9wZSB0aGF0IGhlbHBzICYgZ29vZCBsdWNrIQ0KQ29ub3IuDQoNClsw
XSBodHRwczovL2tlcm5lbG5ld2JpZXMub3JnL0ZpcnN0S2VybmVsUGF0Y2gNClsxXSBodHRwczov
L3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hl
cy5odG1sI3RoZS1jYW5vbmljYWwtcGF0Y2gtZm9ybWF0DQo+ICBkcml2ZXJzL2kyYy9pMmMtY29y
ZS1iYXNlLmMgfCAxNCArKysrKysrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMv
aTJjLWNvcmUtYmFzZS5jIGIvZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jDQo+IGluZGV4IGQ0
M2RiMmMzODc2ZS4uOGUxMjdmZjNlMzJlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9pMmMt
Y29yZS1iYXNlLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jDQo+IEBAIC00
NjksNiArNDY5LDggQEAgc3RhdGljIGludCBpMmNfZGV2aWNlX3Byb2JlKHN0cnVjdCBkZXZpY2Ug
KmRldikNCj4gIAlzdHJ1Y3QgaTJjX2RyaXZlcgkqZHJpdmVyOw0KPiAgCWludCBzdGF0dXM7DQo+
ICANCj4gKwlwcl9pbmZvKCJJIGhhdmUgY2hhbmdlZCBpMmMgZGV2aWNlIGRyaXZlclxuIik7DQo+
ICsNCj4gIAlpZiAoIWNsaWVudCkNCj4gIAkJcmV0dXJuIDA7DQo+ICANCj4gQEAgLTE4MjksNiAr
MTgzMSw3IEBAIGludCBpMmNfZm9yX2VhY2hfZGV2KHZvaWQgKmRhdGEsIGludCAoKmZuKShzdHJ1
Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpKQ0KPiAgCWludCByZXM7DQo+ICANCj4gIAltdXRl
eF9sb2NrKCZjb3JlX2xvY2spOw0KPiArCXByX2luZm8oImkyY19mb3JfZWFjaF9kZXY6IGJlZm9y
ZSBidXNfZm9yX2VhY2hfZGV2XG4iKTsNCj4gIAlyZXMgPSBidXNfZm9yX2VhY2hfZGV2KCZpMmNf
YnVzX3R5cGUsIE5VTEwsIGRhdGEsIGZuKTsNCj4gIAltdXRleF91bmxvY2soJmNvcmVfbG9jayk7
DQo+ICANCj4gQEAgLTE4MzgsOCArMTg0MSwxMCBAQCBFWFBPUlRfU1lNQk9MX0dQTChpMmNfZm9y
X2VhY2hfZGV2KTsNCj4gIA0KPiAgc3RhdGljIGludCBfX3Byb2Nlc3NfbmV3X2RyaXZlcihzdHJ1
Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpDQo+ICB7DQo+ICsJcHJfaW5mbygiRW50ZXIgcHJv
Y2Vzc19uZXdfZHJpdmVyXG4iKTsNCj4gIAlpZiAoZGV2LT50eXBlICE9ICZpMmNfYWRhcHRlcl90
eXBlKQ0KPiAgCQlyZXR1cm4gMDsNCj4gKwlwcl9pbmZvKCJfX3Byb2Nlc3NfbmV3X2RyaXZlciwg
YmVmb3JlIGkyY19kb19hZGRfYWRhcHRlclxuIik7DQo+ICAJcmV0dXJuIGkyY19kb19hZGRfYWRh
cHRlcihkYXRhLCB0b19pMmNfYWRhcHRlcihkZXYpKTsNCj4gIH0NCj4gIA0KPiBAQCAtMTg2MCwx
MyArMTg2NSwxNiBAQCBpbnQgaTJjX3JlZ2lzdGVyX2RyaXZlcihzdHJ1Y3QgbW9kdWxlICpvd25l
ciwgc3RydWN0IGkyY19kcml2ZXIgKmRyaXZlcikNCj4gIAlkcml2ZXItPmRyaXZlci5vd25lciA9
IG93bmVyOw0KPiAgCWRyaXZlci0+ZHJpdmVyLmJ1cyA9ICZpMmNfYnVzX3R5cGU7DQo+ICAJSU5J
VF9MSVNUX0hFQUQoJmRyaXZlci0+Y2xpZW50cyk7DQo+IC0NCj4gKwlwcl9pbmZvKCJpMmMgZHJp
dmVyIG5hbWUgaXMgWyVzXSBiZWZvcmUgZHJpdmVyX3JlZ2lzdGVyXG4iLCBkcml2ZXItPmRyaXZl
ci5uYW1lKTsNCj4gIAkvKiBXaGVuIHJlZ2lzdHJhdGlvbiByZXR1cm5zLCB0aGUgZHJpdmVyIGNv
cmUNCj4gIAkgKiB3aWxsIGhhdmUgY2FsbGVkIHByb2JlKCkgZm9yIGFsbCBtYXRjaGluZy1idXQt
dW5ib3VuZCBkZXZpY2VzLg0KPiAgCSAqLw0KPiAgCXJlcyA9IGRyaXZlcl9yZWdpc3RlcigmZHJp
dmVyLT5kcml2ZXIpOw0KPiAtCWlmIChyZXMpDQo+ICsJaWYgKHJlcyl7DQo+ICsJCXByX2luZm8o
ImkyYyBkcml2ZXIgbmFtZSBpcyBbJXNdLCByZXMgaXMgWyVkXVxuIiwgZHJpdmVyLT5kcml2ZXIu
bmFtZSwgcmVzKTsNCj4gIAkJcmV0dXJuIHJlczsNCj4gKwl9DQo+ICsJcHJfaW5mbygiaTJjIGRy
aXZlciBuYW1lIGlzIFslc10sIGFmdGVyIGRyaXZlcl9yZWdpc3RlclxuIiwgZHJpdmVyLT5kcml2
ZXIubmFtZSk7DQo+ICANCj4gIAlwcl9kZWJ1ZygiZHJpdmVyIFslc10gcmVnaXN0ZXJlZFxuIiwg
ZHJpdmVyLT5kcml2ZXIubmFtZSk7DQo+ICANCj4gQEAgLTE5MzMsNyArMTk0MSw3IEBAIEVYUE9S
VF9TWU1CT0woaTJjX2NsaWVudHNfY29tbWFuZCk7DQo+ICBzdGF0aWMgaW50IF9faW5pdCBpMmNf
aW5pdCh2b2lkKQ0KPiAgew0KPiAgCWludCByZXR2YWw7DQo+IC0NCj4gKwlwcl9pbmZvKCJKYXNv
bi1MZWU6IEVudGVyaW5nIGkyY19pbml0XG4iKTsNCj4gIAlyZXR2YWwgPSBvZl9hbGlhc19nZXRf
aGlnaGVzdF9pZCgiaTJjIik7DQo+ICANCj4gIAlkb3duX3dyaXRlKCZfX2kyY19ib2FyZF9sb2Nr
KTsNCg==
