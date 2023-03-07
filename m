Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857FB6AF76E
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Mar 2023 22:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbjCGVWq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Mar 2023 16:22:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjCGVWp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Mar 2023 16:22:45 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415339CBF2;
        Tue,  7 Mar 2023 13:22:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sr56i2wPeNPqJ+/s5UDxvR9yDLHIoLmeyQxi/xZQbpIOLMTHGF2m6OaqbwtnOzMcYDSZgYgi8dwzAl8/1PWk63A24ZHnTe2/oQAdytyIgirBFPtlj9ZSvfw4FTuWYARV3nOBzDLb1S1RQwjpNxAQnb2FBilNX7/L5PJx7ThUOm4ISLpD1LuIt0Dc8wn16wdArzwqtEkFzihFUw2eKS4Pnnn21qElp4/yf9GPJ0JbK2e9/jHTdQOfoQlB50LH/0jav+CQ5edRRC/LMRaucBtp2h7+S0UYbFoQ2/PXKDqD+91slH8DPWQjGXNmTYzPArYOtddfQMujwEiEAarYFztRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqimqK7VR5U9KExy/8kJ2yHovEI9/kNp+wz2lWk0+iw=;
 b=oNcue4jP9fktFTdtucBfboi1HwdHxR7lp0QXYVZRpW+iLL5kHQpnfZGF9G7II/5P629OI6AQhPs6GUKx8HALhLTNQuRPyqzlaCDMKkq1vJi/CuLQkLaE7cmf1v4W3W3eXLdQdU75cpG+1D4pYVnrk11md5xNcuhC+NDus4+cRFoB0oeRurx2tapZUgNOO/nh0ui3kkXXXuxOr6WBn5JdkT8B4Kvg+BpOGudRvdKWrMbGSL263J4G7AqtzMymD4ej+5WgaOhecsN+ke64HFBVj5Y2HfQNvtq4zOVzUWfmJiB0BtJaUeB4alxN+LicmhEdde3hpyFDX6+orGUmR8PZnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqimqK7VR5U9KExy/8kJ2yHovEI9/kNp+wz2lWk0+iw=;
 b=o2+6YvEPq6nq0hJoPIOBIzUmTSDPHIB6FTSYpcrmYD/F0kfdoTdGlxOuzTJg8yKN/JIfbTpWvZuamrRFM41vBXRZUQEDOZfSEYELIedep5tFGtB/ef5ZFo8k998NmYFk3BZANEl0NmVAi78BWdMRBp0nbWNoK1VlOoYHg9jd8v0=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB8984.namprd12.prod.outlook.com (2603:10b6:208:492::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 21:22:41 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614%9]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 21:22:41 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
CC:     =?utf-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>,
        "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 9/9] i2c: designware: Add support for AMDI0020 ACPI ID
Thread-Topic: [PATCH v3 9/9] i2c: designware: Add support for AMDI0020 ACPI ID
Thread-Index: AQHZTfBhDxARObHPuUW+p5f+6gqeb67tq7kAgAAGmYCAAAekAIAABIuAgAIaEZA=
Date:   Tue, 7 Mar 2023 21:22:40 +0000
Message-ID: <MN0PR12MB6101D5C36665AD228077A0E3E2B79@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230303165050.2918-1-mario.limonciello@amd.com>
 <20230303165050.2918-10-mario.limonciello@amd.com>
 <ZAXWzMFBjo57UUa+@smile.fi.intel.com>
 <0a872110-3f38-0744-17f1-74de3e78f84d@linux.intel.com>
 <ZAXiviOdddEK/Pak@smile.fi.intel.com>
 <f69f0dc1-6fe7-7aa3-4555-bdd5ec3f8f04@amd.com>
In-Reply-To: <f69f0dc1-6fe7-7aa3-4555-bdd5ec3f8f04@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-03-07T21:22:39Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=273bd217-faaa-41bd-839c-aff7dfc4b62a;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-03-07T21:22:39Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 54bdaf30-54a3-4a13-8fba-cd7ceb8e18ee
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|IA0PR12MB8984:EE_
x-ms-office365-filtering-correlation-id: ade283c2-69f9-4385-c13b-08db1f521560
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: StdpCQX+XBMtXBGSI/IeP9dyMhj1hiOeh2QzfM4R7iV74fUpbzImDWMPH+jJo2aQI68M41nZWKlY+Qup9oHU+hwe8uj+eCjfGlpdW7bG37raCHR1SbdOTY9/AT3ts1dzlQY2D3iI7XKlgtWxEdrDeR4YA6DvJeapDQqM/kBKrrAypMsHuAQ8wBd09jylsrf2epFd1nzvI9ClclkANv7WDUEGOP08u+2PqpxwfohCuPwEFNidFlvHJ43Mch5gTDMifXbNVcR32jTCiSjSE4YEcHkUn2hsj2c2OQi2/ID3civznKAizyA7mMhXXX1fFnIKnwjVYoumciUnovYmr57YkAZYxW/0agwitIX9MdKZixjpBT1fYLUu54egs+5q3dQN4xnBbQIfzD4rDoGjv7dNaSEgdoxKEDCD6IRYlH28l99kja7Fbpkoj0lKsArBS7GGAEMYmEYjZ6fypRCnSdAsH7Yo8tTSLEWEGYGkLF9ZJqMJgnRe7mNymGDmFeV0IGyqSXqDye0nGMPpmV37Y2VQ+wVFeRKXtBhAN2rBlHKiHmB2BG3RCH9hn+ODHXRjz6eYIkLf45JogcF4E647YEwpF8KjzJxepyPhtxd4O1Wx/OvTtI/csPy4PcXoPkH8FLGvyzPU/DbyC1ApckAq7vEeMUWRKtKnRvvWVrMrzsYVHj9qvtCvvZe82sSaKtzS1iJr+CS07J2RG3nhZ2QGO+8KfQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199018)(2906002)(52536014)(8936002)(5660300002)(41300700001)(76116006)(316002)(66476007)(4326008)(66446008)(110136005)(64756008)(8676002)(66556008)(66946007)(7696005)(71200400001)(33656002)(55016003)(54906003)(86362001)(38070700005)(53546011)(9686003)(122000001)(478600001)(83380400001)(6506007)(26005)(186003)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWZIaTVCcDh0UWRPa2VrdFRFT3ZySkFva2JzUS9WbW43RFo4Y1UwVlhLdTdW?=
 =?utf-8?B?YXA3a0NUM0tiTFh4THRrbzQ3RUIySjRXL1plcFIyUFpQUllnVVFuQmh0SFds?=
 =?utf-8?B?UytldHVKU2hqOGJaaVorM2VwU0J6UG1zUElKVmJwaVRWNzI3MU96QjlsbGtW?=
 =?utf-8?B?bGJyTTFFY052b2NLWnpqaFJLYU8xbldjNmNIWE81aWgrK0ZXSjZVYlp2OGhN?=
 =?utf-8?B?dGk5ZFJEMCtROFVmalhHMzlWaG51TnA1RzQyTDdLcGl0V1Z6SHFQWUx6Mlht?=
 =?utf-8?B?SHJqckl3cEZOdmJVaDBhWkNyS2JtZmNEZTdzSndtMm9Ic2VaeDBvTTRjQUR0?=
 =?utf-8?B?R3c3ZzlVUzl1K0hvMGlwNDMvTkRnajJoN1JoZSt3WXI5OGdrMit5OUtiVVZW?=
 =?utf-8?B?MVdFRlBXbVpPQTl5SGphRXMyNXNoVjFibEYyNVExRzE5SUp0Vi91YzBSUUZq?=
 =?utf-8?B?K1lVcm90TTVGdFExanlnNVBJZUs4M0w3RW5BcjBtZUpqUDAxdXY2VHVrWjdm?=
 =?utf-8?B?ZUVmMWorVkFSd3BBRVVubmE0a3RzTFVZK0M1OHNBdUVVdTl5MGJ6dzRWV1Ry?=
 =?utf-8?B?cHhvM2NIdFZnMFVLWEhOTzg4aGVMRGpXdkxUM1ljQ2poM2NFV25uTCthaGxj?=
 =?utf-8?B?YjVjSDYxTHlFUlNJQktPQWw3Y0JVUFBIZE1mQVhKZktxY0NEdEdQTmE0NUtE?=
 =?utf-8?B?T2h4YlRpS3VBQWxiT3h4T3ZQTExjcGFyK2R1TmRlam96Z1RtLzMrTnRCS1Zt?=
 =?utf-8?B?dFVOWmJ3WjMrN2xLQ3NJbmEwU1JzMzVLK2VxVGdMMGRYMEszNVkvRGdQUll4?=
 =?utf-8?B?QWNHM0pqcC93a3lUMjJUVU96bXZzVHhER2p4Tmx5TGM1MXJWRVZ3eVdkbkpK?=
 =?utf-8?B?Tm04Zlg4TFdIK3hsY1lTamRsNEdDQkZzQ1V4ZnhrN2VvOG5BK3FzczAwckVN?=
 =?utf-8?B?SnI5K1BYWFUyWmVsVkhVaGV1c2ltV1dBdkJNVitoQm9CcTMxZnlValg0MEZ4?=
 =?utf-8?B?ZklIWk5NbjRBRnBxcDBNcTBOM0JkdTlHazlrY2ludk9xQU9saDBQVlJDM3J4?=
 =?utf-8?B?WU53WFNvTEdQQVZjQUNrSm9EdnJYMzdONlhoZzNSNDlyM2M3Y1lSdjFQcWNR?=
 =?utf-8?B?OXYrNkljVjFKakJlUXNHUkxwdmNvRmRmK2lackswWDZqR0VGdU15Qk9aNHJ2?=
 =?utf-8?B?Nk9rMmY4M0NLMklTTFBsazN2clo5ZW9ueHhyNzZ5NzQ2TmJjdUs5NWRDaCtJ?=
 =?utf-8?B?UW5DYXlrNm9yK1E2bExyUkJ6azJHSVdJK2IrcEZ2M3lOMHc0cXVtM2FsTDlh?=
 =?utf-8?B?VUZLUFA2WUFXRFFYZDRySzNLUHA0a01rR2JqREdRVjZFVlJ3ZDBvWEJrK20w?=
 =?utf-8?B?L2hFMUpQZUZBc1Q1aDNzYmhEU1ZadmM2ZUUvdlJEcW9lSnRnZ2t3ODFMaEtk?=
 =?utf-8?B?ZkFuc2labW5pZTN4VXlYelYvWDE0em1LdFJtdEx2OSs3eXhnM1RjaGZXMDBs?=
 =?utf-8?B?OHl4NXhmS3lMVHk5U01QS3NNNTRmckRYWFMzR1l1bXQwYnVDTEFSK0tmcXFU?=
 =?utf-8?B?NGJ0a29ZeGNMY01wd0tnY3RkVFYrMFo0cUh3UDkySkg0TW8rMmdxYmRiNDNj?=
 =?utf-8?B?SmpKTXUxTGRBbE12L0s5NEFZT1BNVis1T1BobW55bDA4LzlMQ2NXRXhjdmtO?=
 =?utf-8?B?N0NPNHMwVXh5Wnl2cUdRZmo0ajhNbWJHZ1IzZE83M1JoVmN1WmNXVFBxNFBT?=
 =?utf-8?B?cHFWMjQ0RjRIaCt5TE5OOUxRZy8rNUpiZDAwVjRBODE3TmoyUWpLQ0syVTRZ?=
 =?utf-8?B?ZzNZN1hvdno4RmhTY1NSNFBBY2I2VEZRR0dwQ0E4bW0yVGJrWFpNR1ZwZUoy?=
 =?utf-8?B?TDM4Vmw4YmJKR0JuQ0FqWStTNngxbGNsWGNJK2ZYODAxOTFSZUs0UFd2WkFu?=
 =?utf-8?B?SGJLRUQya1UyeDM3OVR3Y25JK1kvQTh6NVVFbVphbXBFbVdiY001QnU5T0Vs?=
 =?utf-8?B?WHRHYXE2LzljLzRjWElTM0dhZ3Q5UHpzc1FhUjBtclNYeVh6dC8wOUJHRjF1?=
 =?utf-8?B?WHNEQk4xYVpFVFMwcEpjYytBMVNHdkc0QlRxbVQzbnlXaEFyN0FlbVhWalhD?=
 =?utf-8?Q?wKfg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ade283c2-69f9-4385-c13b-08db1f521560
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 21:22:40.9186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MW+XEYACl9dCWTTjNdG+mIU1UPJrXZEiJctgCIltqcBp2wKOlVXiUTJR0q+QRezAxKEaUQjit6+0seLpJXUpFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8984
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGlt
b25jaWVsbG8sIE1hcmlvDQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggNiwgMjAyMyAwNzoxMg0KPiBU
bzogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+OyBK
YXJra28gTmlrdWxhDQo+IDxqYXJra28ubmlrdWxhQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IEph
biBExIVicm/FmyA8anNkQHNlbWloYWxmLmNvbT47IEdyemVnb3J6IEJlcm5hY2tpDQo+IDxnamJA
c2VtaWhhbGYuY29tPjsgVGhvbWFzLCBSaWpvLWpvaG4gPFJpam8tam9obi5UaG9tYXNAYW1kLmNv
bT47DQo+IExlbmRhY2t5LCBUaG9tYXMgPFRob21hcy5MZW5kYWNreUBhbWQuY29tPjsNCj4gaGVy
YmVydEBnb25kb3IuYXBhbmEub3JnLmF1OyBNaWthIFdlc3RlcmJlcmcNCj4gPG1pa2Eud2VzdGVy
YmVyZ0BsaW51eC5pbnRlbC5jb20+OyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBsaW51eC0N
Cj4ga2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDkvOV0g
aTJjOiBkZXNpZ253YXJlOiBBZGQgc3VwcG9ydCBmb3IgQU1ESTAwMjAgQUNQSQ0KPiBJRA0KPiAN
Cj4gT24gMy82LzIzIDA2OjU1LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+ID4gT24gTW9uLCBN
YXIgMDYsIDIwMjMgYXQgMDI6Mjg6MDVQTSArMDIwMCwgSmFya2tvIE5pa3VsYSB3cm90ZToNCj4g
Pj4gT24gMy82LzIzIDE0OjA0LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+ID4+PiBPbiBGcmks
IE1hciAwMywgMjAyMyBhdCAxMDo1MDo0N0FNIC0wNjAwLCBNYXJpbyBMaW1vbmNpZWxsbyB3cm90
ZToNCj4gPj4+PiBDZXphbm5lIGFuZCBTa3lyaW0gaGF2ZSB0aGUgc2FtZSBQU1AgaGFyZHdhcmUg
YnV0IHVzZSBhIGRpZmZlcmVudA0KPiA+Pj4+IHByb3RvY29sIHRvIG5lZ290aWF0ZSBJMkMgYXJi
aXRyYXRpb24uIFRvIGRpc2FtYmlndWF0ZSB0aGlzIGdvaW5nDQo+ID4+Pj4gZm9yd2FyZCBpbnRy
b2R1Y2UgYSBuZXcgQUNQSSBJRCB0byByZXByZXNlbnQgdGhlIHByb3RvY29sIHRoYXQgdXRpbGl6
ZXMNCj4gPj4+PiBhIGRvb3JiZWxsLg0KPiA+DQo+ID4gLi4uDQo+ID4NCj4gPj4+PiAtCWlmIChi
b290X2NwdV9kYXRhLng4NiA9PSAyNSAmJiBib290X2NwdV9kYXRhLng4Nl9tb2RlbCA9PSA4MCkN
Cj4gPj4+DQo+ID4+PiBBaCwgaW4gdGhpcyBmb3JtIGl0J3MgZ2V0dGluZyBiZXR0ZXIgdGhhbiBJ
IHRob3VnaHQhDQo+ID4+Pg0KPiA+PiBUaGVzZSByZW1vdmVkIGxpbmVzIHdlcmUgYWRkZWQgYnkg
cHJldmlvdXMgcGF0Y2guIEkgdGhpbmsgYSBiaXQgdG9vIHNob3J0DQo+ID4+IGxpdmVkIGlmIHRo
ZSBzYW1lIHBhdGNoc2V0IGFkZHMgYW5kIHRoZW4gcmVtb3ZlcyBsaW5lcz8NCj4gPg0KPiA+IFRo
YXQgd2hhdCBJIGhhdmUgbWlzc2VkLiBPa2F5LCBjb21pbmcgdG8gc3F1YXJlIDEsIGkuZS4gZHJv
cHBpbmcgQ1BVIElEDQo+ID4gY29tcGxldGVseSBmcm9tIHRoZSBzZXJpZXMuDQo+ID4NCj4gPiBO
b3RlLCBmb3IgdGVzdGluZyBwdXJwb3NlcyB5b3UgbWF5IGFsd2F5cyBhZGQgYSBIQUNLIHBhdGNo
IGF0IHRoZSBlbmQgb2YNCj4gdGhlDQo+ID4gc2VyaWVzLCBtYXJraW5nIGl0IHJlc3BlY3RpdmVs
eS4gU28sIHBlb3BsZSBtYXkgdGVzdCBpdCBhbGwgYW5kIG1haW50YWluZXINCj4gPiBhcHBseSB3
L28gdW5uZWVkZWQgdGFpbC4NCj4gPg0KPiANCj4gSWYgaXQgc3RpbGwgd29ya3MgdGhlbiBuZXcg
SUQgY2FuIGJlIHJlc2VydmVkIGFuZCBwYXRjaGVzIDggYW5kIDkgY291bGQNCj4gYmUgc3F1YXNo
ZWQgdG9nZXRoZXIgZWl0aGVyIGJ5IHN1YnN5c3RlbSBtYWludGFpbmVyIHdoZW4gbWVyZ2luZyBv
ciBmb3INCj4gdjQuICBNeSBhcG9sb2dpZXMgaWYgdGhpcyB3YXNuJ3Qgb2J2aW91cyB0byByZXZp
ZXdlcnMuICBNeSBnb2FsIHdhcyB0bw0KPiBzZXBhcmF0ZSB0aGUgc2NhbGFiaWxpdHkgYW5kIGZ1
bmN0aW9uYWxpdHkgZm9yIHRlc3QgcHVycG9zZXMuDQo+IA0KPiBUaGUgd2F5IEkgZGlkIGl0IHdh
cyB0aGUgc2VyaWVzIGNvdWxkIGJlIHRlc3RlZCB3aXRoIHBhdGNoZXMgMS04IG9uIGJvdGgNCj4g
Q2V6YW5uZSBhbmQgU2t5cmltIHBsYXRmb3JtcyBhbmQgbm8gQklPUyBjaGFuZ2VzLiAgSWYgaXQg
d29ya3MsIEJJT1MgZm9yDQo+IFNreXJpbSBjYW4gYmUgcGF0Y2hlZCBhbmQgcGF0Y2ggOSBjb3Vs
ZCBiZSBhZGRlZCB0byB0ZXN0IGtlcm5lbC4NCg0KSSd2ZSBmb3VuZCB0aGF0IEFNREkwMDIwIGlz
IGFscmVhZHkgcmVzZXJ2ZWQgYW5kIGFsc28gaW4gdXNlIGZvciBhIHdoaWxlLg0KZjVlZGE5OWVl
NmMwYyAoIkFDUEkgLyBBUEQ6IEFkZCBkZXZpY2UgSElEIGZvciBmdXR1cmUgQU1EIFVBUlQgY29u
dHJvbGxlciIpDQoNCkV2ZW4gaWYgcGF0Y2hlcyAxLTkgYWxsIHdvcmsgd2l0aCBhIHBhdGNoZWQg
QklPUyB0byBhZHZlcnRpc2UgQU1ESTAwMjAgaW5zdGVhZA0Kb2YgQU1ESTAwMTksIGJlc2lkZXMg
c3F1YXNoaW5nIHBhdGNoIDggYW5kIDkgd2lsbCBuZWVkIHRvIGRpc2N1c3Mgd2hhdCBJRCB0bw0K
dXNlLg0KDQpGb3IgdGhpcyByZWFzb24sIEkgd291bGQgc3VnZ2VzdCB0aGF0IGlmIDEtOCB3b3Jr
IGFuZCB0aGVyZSBpcyBhZ3JlZW1lbnQgb24gdGhlbQ0KdGhlbiBtZXJnZSAxLTggYW5kIHBhdGNo
IDkgY2FuIGJlIGEgbGF0ZXIgZm9sbG93IHVwIGlmL2FmdGVyIHRoYXQgZGlzY3Vzc2lvbiBhbmQN
CmFsaWdubWVudCB3aXRoIHN0YWtlaG9sZGVycy4NCg==
