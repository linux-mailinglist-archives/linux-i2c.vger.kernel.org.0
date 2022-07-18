Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D44A578348
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jul 2022 15:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbiGRNMI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jul 2022 09:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235471AbiGRNMC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jul 2022 09:12:02 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::622])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2BB22BFC
        for <linux-i2c@vger.kernel.org>; Mon, 18 Jul 2022 06:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8XZnoBN37Y23GXvXv9RsKERL0YMKtBhKIope9Zk5ul3LVRmQs9Q5l+nfjvGJ7tQVqKKFPJNtWSd4o47yHcHc23ejFqwOCW7Jdur+JS2NQ40hUKQawUBlx2F7GL5LGfMVligEWlPXRA2h1PT3CLsKXlNfnVQkma4Yxp+7ytj7tqmlXU0OXZDbAF/1bLHzUEI7OOsuzyasUfX6SsBEboBAFlYfN9IVwcFpzhW9hNZnU9sfDOnxabcHVcztuyrnSBI7qeHuF2tdDF0Ebw+QxVtEu3unpwnZtdBpmcZFdow8ESCJ9UXxqKaMd+fDiomvHoSpyFU8S4wnED6ywk6bN7T+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TbOvCj5s1aM2RVtJAhwEMRE1qC5CcmlAS/kPmNIqoc=;
 b=k1hs4EfLdVJW01SOJo80te9iJvXIntA6MALWLlZ3wLsR0Ke2qr4sKYEHnP6pXTXVJ2kmNpA2SBuNDFdvkpd+eSi976ZnvaLMHeHKcBL0EWW3/YXUDv95aVAbZVmaNGxO6hTlg0j0Q6eCRQ8E6laUobP45v1uF3AKivKgaEyqR1i2fR/uhIp5Pf1adcM5LyjzSmnvYZm8OvkPQ27d0ngMSpHEkSX4iTGuZZaC//bvZCK7WJyt01LAYUwhLnSotu3ZZsW31ELMhDOsUSy2gDm3AtQ4jIyHONIHwJtI+pf5Avm6OVw8FiNTfuSuOj8j48CIKQdGun2EN+opx6RncZotzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TbOvCj5s1aM2RVtJAhwEMRE1qC5CcmlAS/kPmNIqoc=;
 b=gQAv8Uel1e2bjy0qvQl2OXQwGj4CEGNe2CA6FZOlOKKZilnorcukG8Coan5C3ABYkBONMIJrIJcgjlhZ4Ycp2XivsXw+GTPWoKwNdktncqdUszZXbiypFrih1DWwambusaX22sIGTPmnFKLvAhpdCCaYYyfTf4wPhaAjnPBr1UY=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by IA1PR12MB6387.namprd12.prod.outlook.com (2603:10b6:208:389::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 13:11:55 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::c070:5fa5:52c4:5d43]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::c070:5fa5:52c4:5d43%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 13:11:55 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     "Simek, Michal" <michal.simek@amd.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Wolfram Sang <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        git <git@xilinx.com>
Subject: RE: [PATCH] i2c: cadence: Support PEC for SMBus block read
Thread-Topic: [PATCH] i2c: cadence: Support PEC for SMBus block read
Thread-Index: AQHYmeznYUqm5iyLDkS4/kIYRp8pP62D3OSAgAAvgGCAAArlgIAABAJQ
Date:   Mon, 18 Jul 2022 13:11:55 +0000
Message-ID: <BY5PR12MB4902C7B4F8516D15718AE900818C9@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20220717145244.652278-1-lars@metafoo.de>
 <768b56a8-df1c-e24d-7879-328512598549@amd.com>
 <BY5PR12MB4902D36D299948DE036AC0BF818C9@BY5PR12MB4902.namprd12.prod.outlook.com>
 <51fcbbf2-c490-4b2b-fde5-df1dfce7e677@amd.com>
In-Reply-To: <51fcbbf2-c490-4b2b-fde5-df1dfce7e677@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-07-18T13:11:53Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=6318ef64-a4e4-48a1-89ed-0a1cb953fa32;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba618420-0fb8-478d-bb42-08da68bf167f
x-ms-traffictypediagnostic: IA1PR12MB6387:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QZdZse4Iy3SRp6tLIX/YQlNQtek5rfn/Y/TD+cUuQTEowtOpa+rzLABZ1ku17Bwh1bj/enrh+d9O51CovKrgSjf50Y+9LLwQzWXaXyNmtgUJDu9Rj3Fr73k1q8iy29VrdW3lswnJPQI3V/nH06PWmRH5dCZjVuVwCGcJbEAGqozi97DSLa5U83qqPbDflPDPh45VmHL5+tQ8PSWB0KOJnHOXiF0hOx+mu7BUBFpP+ZU1KePacSd/edyT5dmTrMim4Xd6eG8+U6Y4pEMruxZVH1+9vlGJVUqCR6V4vbgTci1tN3TVZ5izfvyLlN5i8/pZemmvba1kV3AeFuM/ZVw66ib+g/8YsSo7ze463XjP96bgxG1O1s1OK7eYtIJ2FVHjYKI91kjqeC+jGkFC3HA1W2OIErE31KPKttTx/RaDgZSGs99p2zSZuBHpCnCkYwX/E48j6z7vdJsbvSJqgWO2Jga6eydrpIzVseRghWAC7CR6dDckGFMmDUiu/SyeqSpaTvTFv/yLALMTELhpusTTnf6030F2m1DGMRpJMX7Rm/RiOzJsY+axtFeJ9nyVYQT3ENd43/PVcPmnxNNTSC84bonMZaAHtxMG8xV1ZNtMLSLujvJaRtb4UPFkzEfGY6Cpq7csh/eoM0GjyrMZ/zfP2shdgdmftgMjWev5fouU1jxMNfWk2x+d8yjylYjCXShMQW2rwYQ0JCGy4EOW6N+Oz6XymSPk5CbE7La+MVVZS3cXMsgBk6QgyMxxtpdxSUGdVEbU10bxEB/dQ0Ey3NHTGCsfbRdPFTo1txz3OFkgozO8rGKTZcslnFsBSkh2/aKM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(9686003)(26005)(83380400001)(186003)(33656002)(41300700001)(2906002)(86362001)(7696005)(6506007)(478600001)(52536014)(53546011)(5660300002)(8936002)(107886003)(38070700005)(38100700002)(122000001)(316002)(110136005)(4326008)(54906003)(8676002)(55016003)(66476007)(71200400001)(64756008)(66946007)(66556008)(76116006)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZndqdTI3R0J6S3oxekc0Mjh2cjJxR2VQQ3ZkSENTNFdnYW5QOHZTaW1PeGtz?=
 =?utf-8?B?UHlzRHF1bXNQMzNXVDVwMXV2Z2dVMnpGVXJJTFp6azFRY3h4eG9GZnFucW5P?=
 =?utf-8?B?akt3OVVIbHF6N1VQSXI3T1NzVXhOU0lMVE1vR1l5cnVtN1ZGME80MFliUWc5?=
 =?utf-8?B?amJqbGxjM1lYd1l1cS9lTjc1blR6bGJERW9XZmhNMmJXenM5dUVTQTIyeDRZ?=
 =?utf-8?B?OFhqcEdNU29wQlpqOEJvVVpTdC9oZnp6WUIyak01K1F2SnJKbytpenFNZDZt?=
 =?utf-8?B?emtveU5uNlpwMUc3aHcvOTVab3VWUnM0akxuT1NaeUZLdG95OTQyeDZ3Z1F2?=
 =?utf-8?B?VlFrWVpOQ1JzT3dRYWxPK0p5b1Y0bEFSNS9RYmZRdjlRTWFUNVR4MkEraGlj?=
 =?utf-8?B?amRiVnlwR0tvY0JUSXdndHhxeEdZVlRiMTRPRGwyU2pBalIvcnhPL2V5MGtN?=
 =?utf-8?B?MStHOFFuQTRHRVBLZEZ2ZHR5T3FhTlF6ZGVvMU1QTDJYak96eExFYUl4Z1V2?=
 =?utf-8?B?WEdveXhPZ213Vm5oTFNFemRESFE4bDRqSUJSV2kwWHFCVDJGTVBmN0xIOVAw?=
 =?utf-8?B?ajJjdndIVmxkS2QvR3o5TzN2SjFreUQwQXpLbEhaNnVqeklLUTRjVDhFQVUy?=
 =?utf-8?B?eGZuSnFSeEd5QWl2blQ5UXhXMDBvZEdHWG5qb1ZsbTlSczBCcm9DT0FwRldL?=
 =?utf-8?B?aHY4dVBSaWp0V3pzWEhueXlicmFKWjBRODhPNzl3S0VmNEh1eCtBR1NjT1Nq?=
 =?utf-8?B?Y0k5eGFoT3RhZm9nOE1EOEFHMFRjaHlSM0dQUlh3dzdpdmxJQmZkY2tFZTFx?=
 =?utf-8?B?Q2pESUlmTjNCYmIzcXQ0VCt3MXdkcTA5KzV4eXVmNmRlei9qZ1ZDMjBtZ3Zr?=
 =?utf-8?B?L3Axb1htcDc0U3BYeisvbEZMS0RMRWlXK3dISE1qMGVQZGpNVGMvSlExV3pK?=
 =?utf-8?B?S2FOZnA3azRGKzNYeE1Samo0WjBVSGxDTjlTMkpaVUtLZFpnb3lwenFTM0lu?=
 =?utf-8?B?WG85anFvTEl1UkFiZnZTZjEySmVlREVlREhPL3VmY1BpV0thcGtwekFUUE5O?=
 =?utf-8?B?OFBCK0NLeDBaQU9TTmpVaWg2cDZJRE9zbTBRZG1LaGRObnNjK3Y5b2tJT2I3?=
 =?utf-8?B?K1Y1UURIVnBIWUxhR3Q3NkYwc3p5QWlYZG5RRlprMFVmeDBxN0tBNlFzd1NF?=
 =?utf-8?B?S2FMR2tHTit0UXNGQkJUMFRvTGNXdHZydmNxNVNjbFdBclEvTnJlZHJhVTZM?=
 =?utf-8?B?NUxIUnBBcWM2LzdFTWEycllZY0k2UlA0eGVUSzE2SEM1NTZJdjkwN09ZRWZp?=
 =?utf-8?B?eDJieCtGSTRoeFcyZGRwOUt0MldHZ3czUHB2NFV0S20yNkJSL3NTWFBRUFdD?=
 =?utf-8?B?Z2xTNEIzekpaSEd1ME5nbnJMUHp4bmFIVTczcFpDbnExSDUvTDB5RVV3ZDA5?=
 =?utf-8?B?THBBZFdEaElZME8zc3hKS3d4TmI4cE9PSUVSYm9YQVFNdFBMVngxZ2hXUnRU?=
 =?utf-8?B?ZjkramFMUmlDdW92SkJwSjZKaTVBTTJQbEJjcHhrMHlEYS9MRzdxZklFUFFH?=
 =?utf-8?B?bnhUTXFJUDlMdkpQWWJJdHB6dGtVRGJpVWp3SVdYU0RJS3N0WEtRRk4zd3N4?=
 =?utf-8?B?bGhEVWJMM094bzBvMlFYUmlpTW92YXRKODZrbUZ3eDRvRTJVNnZKSis0SzhS?=
 =?utf-8?B?MnkrYUQwd0RXaDlPUGgycUdPSHhVbm5hWFhCTDVyWmp5QVVPTHdTcGpEQU1s?=
 =?utf-8?B?QTI4YVBaNmdRcHFKTVlsU0sxQktNNlFKOWJmYytwYzNlek0yY1lDTkI0ZXdF?=
 =?utf-8?B?TFF5Q0F1WFVWOHhlMTQ4UWVUdVRKQmRKaS8zeUdLRFFQdHpNekxNYkNHYXJ3?=
 =?utf-8?B?LytOVm9MWWFLRjVuSEVxL0pDalZ4bnF2aTN2YlFxUHE0Mkp2MEV4aDFNOUhq?=
 =?utf-8?B?SmNXUVFXTzN5NnhMK3AvRjJ4VitHUExvdjBYN3kyY2x0NnFtQS83SHdJSSt0?=
 =?utf-8?B?UTM1ZUlIS1hWUWp3Qm42SjlOSk8zUzF5aU9yQWFVcHZXN1Q3Mkh0eVFwcFpp?=
 =?utf-8?B?SUJqUjFQVGM2VlJrQzNma0lMaklvaWc0UmlrK2FCV3RSQjJlbmZPTU9oNHRB?=
 =?utf-8?Q?Glrg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba618420-0fb8-478d-bb42-08da68bf167f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 13:11:55.1546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3+nB+ajmfTqxGO66IOTm1dcE9KUZHJAPOPOm5fcGBwehtmS4Hsageeh6YOtqC2WsLneQ2bobhJTfb97c5vWiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6387
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IFNpbWVrLCBNaWNoYWwgPG1pY2hhbC5zaW1la0BhbWQuY29t
Pg0KPiBTZW50OiBNb25kYXksIEp1bHkgMTgsIDIwMjIgNjoyNSBQTQ0KPiBUbzogRGF0dGEsIFNo
dWJocmFqeW90aSA8c2h1YmhyYWp5b3RpLmRhdHRhQGFtZC5jb20+OyBMYXJzLVBldGVyIENsYXVz
ZW4NCj4gPGxhcnNAbWV0YWZvby5kZT47IFdvbGZyYW0gU2FuZyA8d3NhQGtlcm5lbC5vcmc+DQo+
IENjOiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBnaXQgPGdpdEB4aWxpbnguY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIXSBpMmM6IGNhZGVuY2U6IFN1cHBvcnQgUEVDIGZvciBTTUJ1cyBi
bG9jayByZWFkDQo+IA0KPiANCj4gDQo+IE9uIDcvMTgvMjIgMTQ6MzcsIERhdHRhLCBTaHViaHJh
anlvdGkgd3JvdGU6DQo+ID4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQo+ID4N
Cj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IFNp
bWVrLCBNaWNoYWwgPG1pY2hhbC5zaW1la0BhbWQuY29tPg0KPiA+PiBTZW50OiBNb25kYXksIEp1
bHkgMTgsIDIwMjIgMjo1NiBQTQ0KPiA+PiBUbzogTGFycy1QZXRlciBDbGF1c2VuIDxsYXJzQG1l
dGFmb28uZGU+OyBXb2xmcmFtIFNhbmcNCj4gPj4gPHdzYUBrZXJuZWwub3JnPjsgRGF0dGEsIFNo
dWJocmFqeW90aSA8c2h1YmhyYWp5b3RpLmRhdHRhQGFtZC5jb20+DQo+ID4+IENjOiBsaW51eC1p
MmNAdmdlci5rZXJuZWwub3JnOyBnaXQgPGdpdEB4aWxpbnguY29tPg0KPiA+PiBTdWJqZWN0OiBS
ZTogW1BBVENIXSBpMmM6IGNhZGVuY2U6IFN1cHBvcnQgUEVDIGZvciBTTUJ1cyBibG9jayByZWFk
DQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+IE9uIDcvMTcvMjIgMTY6NTIsIExhcnMtUGV0ZXIgQ2xh
dXNlbiB3cm90ZToNCj4gPj4+IFNNQnVzIHBhY2tldCBlcnJvciBjaGVja2luZyAoUEVDKSBpcyBp
bXBsZW1lbnRlZCBieSBhcHBlbmRpbmcgb25lDQo+ID4+PiBhZGRpdGlvbmFsIGJ5dGUgb2YgY2hl
Y2tzdW0gZGF0YSBhdCB0aGUgZW5kIG9mIHRoZSBtZXNzYWdlLiBUaGlzDQo+ID4+PiBwcm92aWRl
cyBhZGRpdGlvbmFsIHByb3RlY3Rpb24gYW5kIGFsbG93cyB0byBkZXRlY3QgZGF0YSBjb3JydXB0
aW9uDQo+ID4+PiBvbiB0aGUNCj4gPj4gSTJDIGJ1cy4NCj4gPj4+DQo+ID4+PiBTTUJ1cyBibG9j
ayByZWFkcyBzdXBwb3J0IHZhcmlhYmxlIGxlbmd0aCByZWFkcy4gVGhlIGZpcnN0IGJ5dGUgaW4N
Cj4gPj4+IHRoZSByZWFkIG1lc3NhZ2UgaXMgdGhlIG51bWJlciBvZiBhdmFpbGFibGUgZGF0YSBi
eXRlcy4NCj4gPj4+DQo+ID4+PiBUaGUgY29tYmluYXRpb24gb2YgUEVDIGFuZCBibG9jayByZWFk
IGlzIGN1cnJlbnRseSBub3Qgc3VwcG9ydGVkIGJ5DQo+ID4+PiB0aGUgQ2FkZW5jZSBJMkMgZHJp
dmVyLg0KPiA+Pj4gICAgKiBXaGVuIFBFQyBpcyBlbmFibGVkIHRoZSBtYXhpbXVtIHRyYW5zZmVy
IGxlbmd0aCBmb3IgYmxvY2sgcmVhZHMNCj4gPj4+ICAgICAgaW5jcmVhc2VzIGZyb20gMzMgdG8g
MzQgYnl0ZXMuDQo+ID4+PiAgICAqIFRoZSBJMkMgY29yZSBzbWJ1cyBlbXVsYXRpb24gbGF5ZXIg
cmVsaWVzIG9uIHRoZSBkcml2ZXIgdXBkYXRpbmcgdGhlDQo+ID4+PiAgICAgIGBpMmNfbXNnYCBg
bGVuYCBmaWVsZCB3aXRoIHRoZSBudW1iZXIgb2YgcmVjZWl2ZWQgYnl0ZXMuIFRoZSB1cGRhdGVk
DQo+ID4+PiAgICAgIGxlbmd0aCBpcyB1c2VkIHdoZW4gY2hlY2tpbmcgdGhlIFBFQy4NCj4gPj4+
DQo+ID4+PiBBZGQgc3VwcG9ydCB0byB0aGUgQ2FkZW5jZSBJMkMgZHJpdmVyIGZvciBoYW5kbGlu
ZyBTTUJ1cyBibG9jayByZWFkcw0KPiA+Pj4gd2l0aCBQRUMuIFRvIGRldGVybWluZSB0aGUgbWF4
aW11bSB0cmFuc2ZlciBsZW5ndGggdXNlcyB0aGUgaW5pdGlhbA0KPiA+Pj4gYGxlbmAgdmFsdWUg
b2YgdGhlIGBpMmNfbXNnYC4gV2hlbiBQRUMgaXMgZW5hYmxlZCB0aGlzIHdpbGwgYmUgMiwNCj4g
Pj4+IHdoZW4gaXQgaXMgZGlzYWJsZWQgaXQgd2lsbCBiZSAxLg0KPiA+Pj4NCj4gPj4+IE9uY2Ug
YSByZWFkIHRyYW5zZmVyIGlzIGRvbmUgYWxzbyBpbmNyZW1lbnQgdGhlIGBsZW5gIGZpZWxkIGJ5
IHRoZQ0KPiA+Pj4gYW1vdW50IG9mIHJlY2VpdmVkIGRhdGEgYnl0ZXMuDQo+ID4+Pg0KPiA+Pj4g
VGhpcyBjaGFuZ2UgaGFzIGJlZW4gdGVzdGVkIHdpdGggYSBVQ005MDMyMCBQTUJ1cyBwb3dlciBt
b25pdG9yLA0KPiA+PiB3aGljaA0KPiA+Pj4gcmVxdWlyZXMgYmxvY2sgcmVhZHMgdG8gYWNjZXNz
IGNlcnRhaW4gZGF0YSBmaWVsZHMsIGJ1dCBhbHNvIGhhcyBQRUMNCj4gPj4+IGVuYWJsZWQgYnkg
ZGVmYXVsdC4NCj4gPj4+DQo+ID4+PiBGaXhlczogZGY4ZWI1NjkxYzQ4ICgiaTJjOiBBZGQgZHJp
dmVyIGZvciBDYWRlbmNlIEkyQyBjb250cm9sbGVyIikNCj4gPj4NCj4gPj4gU3ViamVjdCBpcyBz
YXlpbmcgdGhhdCB5b3UgYWRkaW5nIHN1cHBvcnQgZm9yIFBFQyBhbmQgaGVyZSB5b3UgYXJlDQo+
ID4+IHNheWluZyB0aGF0IGl0IGlzIGZpeGluZyBpbml0aWFsIGNvbW1pdC4NCj4gPj4NCj4gPj4g
SWYgdGhpcyBpcyBhZGRpbmcgbmV3IHN1cHBvcnQgSSB0aGluayBGaXhlcyB0YWcgc2hvdWxkbid0
IGJlIGhlcmUuDQo+ID4+DQo+ID4+IElmIGl0IGlzIGZpeGluZyBpc3N1ZSBzdWJqZWN0IHNob3Vs
ZCBiZSB1cGRhdGVkIGFuZCB0aGlzIEZpeGVzIHRhZyBrZXB0IGhlcmUuDQo+ID4+DQo+ID4+IFRo
ZSByZXN0IGxvb2tzIGdvb2QgdG8gbWUuDQo+ID4+DQo+ID4+IFNodWJocmFqeW90aTogQ2FuIHlv
dSBwbGVhc2UgdGVzdD8NCj4gPg0KPiA+IEkgaGF2ZSB0ZXN0ZWQgdGhlIHJlYWRzIGFuZCB3cml0
ZSBzbWJ1cyAgd2l0aG91dCBwYWNrZXQgZXJyb3IgY2hlY2suDQo+IA0KPiBDYW4geW91IHBsZWFz
ZSBzd2l0Y2ggaXQgdG8gZm9ybWFsIFRlc3RlZC1ieTogdGFnPw0KVGVzdGVkLWJ5OiAgU2h1Ymhy
YWp5b3RpIERhdHRhIDxTaHViaHJhanlvdGkuZGF0dGFAYW1kLmNvbSA+DQoNCj4gDQo+IE0NCg==
